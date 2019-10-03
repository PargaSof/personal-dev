import json
import psycopg2

class DatabaseConnection:
    # This class will be called to establish a connection with the PostgreSQL DB.

    def __init__(self):
        try:
            with open('config.json') as f:
                db_config = json.load(f)

            self.conn = psycopg2.connect(
                host=db_config['host'],
                database=db_config['database'],
                user=db_config['user'],
                password=db_config['password'])
            self.conn.autocommit = True
            self.cur = self.conn.cursor()
            print("Connection with local PostgreSQL DB established")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def close_connection(self):
        self.cur.close()
        self.conn.close()
        print("Connection with local PostgreSQL DB is closed")