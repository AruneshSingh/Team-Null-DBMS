# Team NULL DBMS Project


## Project Description

Designing a comprehensive database which allows travellers to visit multiple places as per their
interest, by suggesting a custom made itinerary just for them. It would have data about all the
places of interest, including the best time to view them and its reviews among other things.
Thereby, allowing a traveller to achieve the most out of the limited budget and time they have. It
also allows them to find out where their friends are. Moreover, it also allows users to add their
own places of interest to the pre existing categories.
The travellers are assisted by a team of drivers who also access the database to find the best
route to take, the nearest gas station etc.
The police also use this database extensively to determine where patrolling is needed by
checking the database to find out where the other police officers are, and which areas are
congested or deserted at that moment so that reinforcements can be sent to that road.
This database is also pivotal for the government in taking out new policy decisions. The
government uses the data of road congestion over time and changes in the population over time
to decide where roads need to be improved. It can also utilize the database to find out how
much revenue it’s earning from the entry tickets, challans, taxes etc.


## Structure

We have made a cross platform app using Flutter . The database is hosted on
www.remotemysql.com . We access the database through a locally hosted server made with
flask and pymysql . We then use the locally hosted server as the backend of our application to
run queries on the database and give results to the flutter app through http requests.


## How to run

- Run abcd.py from the python_scripts directory inside lib to start the local server
- Run the flutter app 
