TMDB_API_to_DB

------------------------

README file

------------------------

Description:

The program is broken in 3 classes:

1) DatabaseConnection (DC):
	DC class acts as a parent to DT. DC is used to establish a connection with the database (PostgreSQL 11 in this case). It connects through the driver found in Python module 'psycopg2' and opens a cursor.

	The configuration parameters that are needed to connect to the database are stored in an external file called 'config.json'.

2) DatabaseTasks (DT):
	DT is the class responsible for the execution of all DML queries. It inherits the connection from the parent (DC).

3) MovieApi (MA):
	MA class is responsible for all API calls. For every SQL DML task there is a feed of data from an API call through MA. Some necessary parameters like the base API url and the API key, are stored in the external configuration file 'config.json'.

	The functions in MA make use of the 'requests' and 'json' python libraries. With 'requests' it is possible to communicate with the Server Side and get back a response. Subsequently by using the 'json' library we are able to format the response in a way that can be parsed with Python commands.

After all the classes have been setup and saved in different files, the main() function is called. Inside the main function, there are all the DC, DT and MA classes and function calls. All calls have been placed in such an order that the ingestion of data into the PostgreSQL instance will respect the Foreign Key constraints that exist in the tables.

The PostgreSQL database schema called 'test' is built with the DDL commands found in the 'TMDB_DDL.sql' file. Also, a data model has been created to aid the user in visualizing the database relationships (see file 'TMDB_Data_Model').

Scheduling:

A module called 'schedule' has been installed that uses a friendly syntax to repeat tasks at chosen intervals.

The last bit of code in the 'main.py' file that has been commented out, is the code responsible for kicking the task according to the set schedule.








