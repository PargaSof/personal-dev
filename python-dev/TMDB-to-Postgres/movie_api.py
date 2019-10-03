import requests as req
import json


class MovieApi:
    movie_errors_log = []
    del_movie_list = []

    def __init__(self):
        with open('config.json') as config_file:
            config_data = json.load(config_file)

        self.movies_api_url = config_data['movies_api_url']
        self.movies_api_key = config_data['movies_api_key']

    def grab_num_pages(self, type):
        # The purpose of this function is to return the number of pages that
        # the different types of JSON data (movies, reviews, authors, genres)
        # are stored in the TMDB API. Then we can use that number to iterate
        # through all these pages and extract all relevant data.

        if type == 'movie':
            url = self.movies_api_url + '/movie/now_playing?api_key={key}'.format(key=self.movies_api_key)
            json_data = req.get(url).json()
            num_of_pages = json_data['total_pages']
        else:
            print('The input name is either misspelled or out of scope')

        return num_of_pages

    def movie_data_plus_genres(self, pages):
        # By receiving the number of total pages as an input, we can iterate through
        # all pages of the API results and extract all movies that are playing now.
        # We can also extract all related genres of movies and populate the junction
        # table Movie_Genre

        movie_id = None
        title = None
        popularity = None
        release_date = None
        genre_id = None

        movie_data = []
        movie_genre_data = []

        i = 1

        # This "While" loop is need for the iteration through all API pages
        while i <= pages:

            movie_url = self.movies_api_url + '/movie/now_playing?page={num}&api_key={key}'.format(num=i, key=self.movies_api_key)

            json_movie = req.get(movie_url).json()

            # The following for "for" loop will parse the JSON data and extract specific
            # values from 4 relevant keys. It will then store those values inside a tuple.
            # Each tuple will refer to one record/movie. A list will be created to store
            # all these tuples (movie_data).
            for item in json_movie['results']:
                movie_id = item['id']
                title = item['title']
                popularity = item['popularity']
                release_date = item['release_date']

                movie_data.append((movie_id, title, popularity, release_date))

                for x in item['genre_ids']:
                    genre_id = x
                    movie_genre_data.append((movie_id, genre_id))

            i += 1

        return movie_data, movie_genre_data

    def extract_genre_data(self):
        genre_id = None
        name = None

        genre_data = []

        genre_url = self.movies_api_url + '/genre/movie/list?api_key={key}'.format(key=self.movies_api_key)
        json_genre = req.get(genre_url).json()

        for item in json_genre['genres']:
            genre_id = item['id']
            name = item['name']

            genre_data.append((genre_id, name))

        return genre_data

    # Populate the junction table movie_genre
    # Movie-Genre data can be extracted from the now playing movies of the API
    # Genre ids and respective names can be extracted either from the detailed
    # representation of movies or from the genre GET method

    def extract_movie_genres(self, pages):
        # Again we need the number of pages since we keep on using the now playing
        # movies resource API
        # Below are empty strings matching the number and type of columns we will
        # populate

        # TODO: Embed this function into the now_playing_movies one. They both use
        # the same endpoint

        # DONE (26/01/19 - v2.2)

        movie_id = None
        genre_id = None

        movie_genre_data = []

        i = 1

        while i <= pages:

            movie_url = self.movies_api_url + '/movie/now_playing?page={num}&api_key={key}'.format(num=i, key=self.movies_api_key)
            json_movie = req.get(movie_url).json()

            for item in json_movie['results']:
                movie_id = item['id']

                for x in item['genre_ids']:
                    genre_id = x
                    movie_genre_data.append((movie_id, genre_id))

            i += 1
        return movie_genre_data

    def extract_country_data(self):

        url = self.movies_api_url + '/configuration/countries?api_key={key}'.format(key=self.movies_api_key)
        json_data = req.get(url).json()

        country_iso = None
        country_name = None

        country_data = []

        for item in json_data:
            country_iso = item['iso_3166_1']
            country_name = item['english_name']

            country_data.append((country_iso, country_name))

        return country_data

    def extract_review_data(self, data):

        review_data = []
        review_movie_data = []

        for movie_id in data:

            try:
                url = self.movies_api_url + '/movie/{movie_id}/reviews?api_key={key}'.format(movie_id=movie_id, key=self.movies_api_key)
                json_review = req.get(url).json()

                num_of_pages = json_review['total_pages']

                print('({0},{1})'.format(movie_id, num_of_pages))
            except:
                review_keyerror = '{} Movie ID has raised a KeyError - "total_pages"'.format(movie_id)
                print(review_keyerror)
                MovieApi.movie_errors_log.append(review_keyerror)
                if (movie_id,) not in MovieApi.del_movie_list:
                    MovieApi.del_movie_list.append((movie_id,))
                continue

            author = None
            content = None
            review_id = None

            i = 1

            if num_of_pages > 1:

                while i <= num_of_pages:
                    url = self.movies_api_url + '/movie/{movie_id}/reviews?page={num}&api_key={key}'.format(movie_id=movie_id, num=i, key=self.movies_api_key)
                    new_json_review = req.get(url).json()

                    for y in new_json_review['results']:
                        author = y['author']
                        content = y['content']
                        review_id = y['id']

                        review_data.append((review_id, author, content))
                        review_movie_data.append((movie_id, review_id))

                    i += 1
            elif num_of_pages == 1:

                for x in json_review['results']:
                    author = x['author']
                    content = x['content']
                    review_id = x['id']

                    review_data.append((review_id, author, content))
                    review_movie_data.append((movie_id, review_id))
            else:
                True

        return review_data, review_movie_data

    def extract_movie_prod_country_data(self, data):

        prod_country = None
        movie_prod_country_data = []

        for movie_id in data:
            url = self.movies_api_url + '/movie/{movie_id}?api_key={key}'.format(movie_id=movie_id, key=self.movies_api_key)
            json_review = req.get(url).json()

            try:
                for item in json_review['production_countries']:
                    try:
                        prod_country_iso = item['iso_3166_1']
                        movie_prod_country_data.append((movie_id, prod_country_iso))
                    except:
                        movieprod_iso_keyerror = '{} Movie ID has raised a KeyError - "iso_3166_1"'.format(movie_id)
                        print(movieprod_iso_keyerror)
                        MovieApi.movie_errors_log.append(movieprod_iso_keyerror)
                        if (movie_id,) not in MovieApi.del_movie_list:
                            MovieApi.del_movie_list.append((movie_id,))
                        continue
            except:
                movieprod_keyerror = '{} Movie ID has raised a KeyError - "production_countries"'.format(movie_id)
                print(movieprod_keyerror)
                MovieApi.movie_errors_log.append(movieprod_keyerror)
                if (movie_id,) not in MovieApi.del_movie_list:
                    MovieApi.del_movie_list.append((movie_id,))
                continue

        return movie_prod_country_data

    def extract_movie_play_country_data(self, data):

        movie_play_country_data = []

        for movie_id in data:

            movie_play_country = None
            movie_play_country_rel_date = None

            url = self.movies_api_url + '/movie/{movie_id}/release_dates?api_key={key}'.format(movie_id=movie_id, key=self.movies_api_key)
            json_review = req.get(url).json()
            try:
                for item in json_review['results']:
                    try:
                        if item['iso_3166_1'] == 'GR':

                            movie_play_country = item['iso_3166_1']

                            for x in item['release_dates']:

                                movie_play_country_rel_date = x['release_date']

                                movie_play_country_data.append((movie_id, movie_play_country, movie_play_country_rel_date))
                        elif item['iso_3166_1'] == 'US':

                            movie_play_country = item['iso_3166_1']

                            for x in item['release_dates']:

                                movie_play_country_rel_date = x['release_date']

                                movie_play_country_data.append((movie_id, movie_play_country, movie_play_country_rel_date))
                        elif item['iso_3166_1'] == 'GB':

                            movie_play_country = item['iso_3166_1']

                            for x in item['release_dates']:

                                movie_play_country_rel_date = x['release_date']

                                movie_play_country_data.append((movie_id, movie_play_country, movie_play_country_rel_date))
                        elif item['iso_3166_1'] == 'CA':

                            movie_play_country = item['iso_3166_1']

                            for x in item['release_dates']:

                                movie_play_country_rel_date = x['release_date']

                                movie_play_country_data.append((movie_id, movie_play_country, movie_play_country_rel_date))
                        else:
                            True
                    except:
                        movieplay_iso_keyerror = '{} Movie ID has raised a play_country KeyError - "iso_3166_1"'.format(movie_id)
                        print(movieplay_iso_keyerror)
                        MovieApi.movie_errors_log.append(movieplay_iso_keyerror)
                        if (movie_id,) not in MovieApi.del_movie_list:
                            MovieApi.del_movie_list.append((movie_id,))
                        continue
            except:
                movieplay_results_keyerror = '{} Movie ID has raised a play_country KeyError - "results"'.format(movie_id)
                print(movieplay_results_keyerror)
                MovieApi.movie_errors_log.append(movieplay_results_keyerror)
                if (movie_id,) not in MovieApi.del_movie_list:
                    MovieApi.del_movie_list.append((movie_id,))
                continue

        return movie_play_country_data

    def extract_movie_director_data(self, data):

        movie_director_data = []

        for movie_id in data:

            director_id = None
            name = None

            url = self.movies_api_url + '/movie/{movie_id}/credits?api_key={key}'.format(movie_id=movie_id, key=self.movies_api_key)
            json_review = req.get(url).json()

            try:
                for item in json_review['crew']:

                    if item['department'] == 'Directing':
                        if item['job'] == 'Director':

                            director_id = item['id']
                            name = item['name']

                            movie_director_data.append((movie_id, director_id, name))
            except:
                moviedirector_keyerror = '{} Movie Id has raised a movie_director KeyError - "crew"'.format(movie_id)
                print(moviedirector_keyerror)
                MovieApi.movie_errors_log.append(moviedirector_keyerror)
                if (movie_id,) not in MovieApi.del_movie_list:
                    MovieApi.del_movie_list.append((movie_id,))
                continue
        return movie_director_data
