import psycopg2

from db_connection import DatabaseConnection


class DatabaseTasks(DatabaseConnection):
    # This class inherits connectivity from parent DatabaseConnection class.
    # It will be used as central repository for all PostreSQL CRUD operations.

    def read_all_movie_ids(self):

        query_results = None
        id_list = []

        try:
            sql_query = """SELECT movie_id FROM test.movie"""
            self.cur.execute(sql_query)
            query_results = self.cur.fetchall()
            print(self.cur.rowcount, "rows were read from the test.movie table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

        data = query_results

        for x in data:
            id_list.append(x[0])

        return id_list

    def ingest_movie_data(self, data):
        try:
            sql_query = """ INSERT INTO test.movie (movie_id,title,popularity,release_date)
                            VALUES (%s, %s, %s, %s)
                            ON CONFLICT ON CONSTRAINT movie_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.movie table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_genre_data(self, data):
        try:
            sql_query = """ INSERT INTO test.genre (genre_id,name)
                            VALUES (%s, %s)
                            ON CONFLICT ON CONSTRAINT genre_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.genre table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_movie_genre_data(self, data):
        try:
            sql_query = """ INSERT INTO test.movie_genre (movie_id,genre_id)
                            VALUES (%s, %s)
                            ON CONFLICT ON CONSTRAINT movie_genre_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.movie_genre table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_country_data(self, data):
        try:
            sql_query = """ INSERT INTO test.country (country_iso,name)
                            VALUES (%s, %s)
                            ON CONFLICT ON CONSTRAINT country_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.country table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_review_data(self, data):
        try:
            sql_query = """ INSERT INTO test.review (review_id, author, content)
                            VALUES (%s, %s, %s)
                            ON CONFLICT ON CONSTRAINT review_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.review table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_movie_review_data(self, data):
        try:
            sql_query = """ INSERT INTO test.movie_review (movie_id,review_id)
                            VALUES (%s, %s)
                            ON CONFLICT ON CONSTRAINT movie_review_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.movie_review table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_movie_prod_country_data(self, data):
        try:
            sql_query = """ INSERT INTO test.movie_prod_country (movie_id,country_iso)
                            VALUES (%s, %s)
                            ON CONFLICT ON CONSTRAINT movie_prod_country_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.movie_prod_country table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_movie_play_country_data(self, data):
        try:
            sql_query = """ INSERT INTO test.movie_play_country (movie_id,country_iso,release_date)
                            VALUES (%s, %s, %s)
                            ON CONFLICT ON CONSTRAINT movie_play_country_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.movie_play_country table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def ingest_movie_director_data(self, data):
        try:
            sql_query = """ INSERT INTO test.movie_director (movie_id,director_id,name)
                            VALUES (%s, %s, %s)
                            ON CONFLICT ON CONSTRAINT movie_director_pkey 
                            DO NOTHING;"""
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Records inserted successfully into test.movie_director table")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def delete_failed_movies(self, data):
        try:
            sql_query = """ DELETE FROM test.movie
                            WHERE movie_id = %s """
            self.cur.executemany(sql_query, data)
            print(self.cur.rowcount, "Movie records were successfully deleted from the Database")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
