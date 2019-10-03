#########################################################
#   -- From The Movie Database API to PostgreSQL --     #
#                                                       #
# Extract information related to films playing now  in  #
# the theaters. Store this information in a relational  #
# format in a PostgreSQL DB instance.                   #
#                                                       #
# Author: Sofoklis Vourekas                             #
#                                                       #
# Version Control | Date                                #
#-----------------------------------                    #
# 1.0             | 12 January 2019                     #
# 2.0             | 13 January 2019                     #
#                                                       #
# 2.1             | 21 January 2019                     #
# + Added try-except blocks in failing MovieApi methods #
# for overcoming JSON key errors                        #
# + Added errors log                                    #
#                                                       #
# 2.2             | 26 January 2019                     #
# + Embedded movie_genre extraction into                #
# now_playing_movies def, now labeled as                #
# movie_data__plus_genres                               #
# + Created a list of the movie IDs that produced an    #
# error                                                 #
# + Created a db_tasks method for deleting all Ids      #
# found in the above list                               #
#                                                       #
#########################################################


import requests as req
import json
import time
import schedule

from db_connection import DatabaseConnection
from movie_api import MovieApi
from db_tasks import DatabaseTasks


def main():
    # Tasks should be triggered in such a sequence that the population
    # of tables will not fail due to foreign key violation
    db_tasks = DatabaseTasks()
    api = MovieApi()

    ## Block 1 ##
    # Populate Movies table
    num_pages_movies = api.grab_num_pages('movie')
    movie_data__plus_genres = api.movie_data_plus_genres(num_pages_movies)
    db_tasks.ingest_movie_data(movie_data__plus_genres[0])

    # Read Movie Ids
    movie_id_list = db_tasks.read_all_movie_ids()

    ## Block 2 ##
    # Populate Genres table
    genre_data = api.extract_genre_data()
    db_tasks.ingest_genre_data(genre_data)

    ## Block 3 ##
    # Populate Movie_Genre junction table
    db_tasks.ingest_movie_genre_data(movie_data__plus_genres[1])

    ## Block 4 ##
    # Populate Country table
    country_data = api.extract_country_data()
    db_tasks.ingest_country_data(country_data)

    ## Block 5 ##
    # Populate Review tables
    review_data = api.extract_review_data(movie_id_list)
    db_tasks.ingest_review_data(review_data[0])
    # Populate Movie_Review table
    db_tasks.ingest_movie_review_data(review_data[1])

    ## Block 6 ##
    # Populate Movie_Prod_Country table
    movie_prod_country_data = api.extract_movie_prod_country_data(movie_id_list)
    db_tasks.ingest_movie_prod_country_data(movie_prod_country_data)

    ## Block 7 ##
    # Populate Movie_Play_Country table
    movie_play_country_data = api.extract_movie_play_country_data(movie_id_list)
    db_tasks.ingest_movie_play_country_data(movie_play_country_data)

    ## Block 8 ##
    # Populate Movie_Director table
    movie_director_data = api.extract_movie_director_data(movie_id_list)
    db_tasks.ingest_movie_director_data(movie_director_data)

    print('Error log: {}'.format(MovieApi.movie_errors_log))

    print('Failed Movie Id list: {}'.format(MovieApi.del_movie_list))

    # Delete Failed Movies from Movie table:
    # Should trigger ON CASCADE and delete from all junction tables
    # with movie_id as a FK
    db_tasks.delete_failed_movies(MovieApi.del_movie_list)

    db_tasks.close_connection()


main()

# schedule.every().day.at("00:00").do(main)

# while True:
#    schedule.run_pending()
#    time.sleep(1)
