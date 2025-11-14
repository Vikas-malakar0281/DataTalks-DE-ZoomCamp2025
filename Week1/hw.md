# Module 1 Homework: Docker & SQL
In this homework we'll prepare the environment and practice Docker and SQL

In this homework we'll prepare the environment and practice Docker and SQL

When submitting your homework, you will also need to include a link to your GitHub repository or other public code-hosting site.

This repository should contain the code for solving the homework.

When your solution has SQL or shell commands and not code (e.g. python files) file format, include them directly in the README file of your repository.

## Question 1. Understanding docker first run
Run docker with the python:3.12.8 image in an interactive mode, use the entrypoint bash.

What's the version of pip in the image?

- Answer `pip 24.3.1`

## Question 2. Understanding Docker networking and docker-compose
Given the following `docker-compose.yaml`, what is the `hostname` and `port` that `pgadmin` should use to connect to the `postgres` `database`?

```yml
services:
  db:
    container_name: postgres
    image: postgres:17-alpine
    environment:
      POSTGRES_USER: 'postgres'
      POSTGRES_PASSWORD: 'postgres'
      POSTGRES_DB: 'ny_taxi'
    ports:
      - '5433:5432'
    volumes:
      - vol-pgdata:/var/lib/postgresql/data

  pgadmin:
    container_name: pgadmin
    image: dpage/pgadmin4:latest
    environment:
      PGADMIN_DEFAULT_EMAIL: "pgadmin@pgadmin.com"
      PGADMIN_DEFAULT_PASSWORD: "pgadmin"
    ports:
      - "8080:80"
    volumes:
      - vol-pgadmin_data:/var/lib/pgadmin  

volumes:
  vol-pgdata:
    name: vol-pgdata
  vol-pgadmin_data:
    name: vol-pgadmin_data
postgres:5433
localhost:5432
db:5433
postgres:5432
db:5432
```
If there are more than one answers, select only one of them  

- Answer `postgres:5432`

## Prepare Postgres
Run Postgres and load data as shown in the videos We'll use the green taxi trips from October 2019:

`wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz`
You will also need the dataset with zones:

`wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv`
Download this data and put it into Postgres.

You can use the code from the course. It's up to you whether you want to use Jupyter or a python script.

## Question 3. Trip Segmentation Count
During the period of October 1st 2019 (inclusive) and November 1st 2019 (exclusive), how many trips, respectively, happened:

Up to 1 mile
In between 1 (exclusive) and 3 miles (inclusive),  
In between 3 (exclusive) and 7 miles (inclusive),  
In between 7 (exclusive) and 10 miles (inclusive),  
Over 10 miles  
Answers:  

For,  
Up to 1 mile :
```sql
SELECT 
	COUNT(*)
FROM public."hw-green"
WHERE 
	lpep_pickup_datetime >= '2019-10-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance <= 1;
```
`Result = 78964`  
  
for between 1 to 3 miles:  
```sql
SELECT 
	COUNT(*)
FROM public."hw-green"
WHERE 
	lpep_pickup_datetime >= '2019-10-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 1 and trip_distance <= 3 ;
```
`Result = 150850`  
  
for between 3 to 7 miles:  
```sql
SELECT 
	COUNT(*)
FROM public."hw-green"
WHERE 
	lpep_pickup_datetime >= '2019-10-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 3 and trip_distance <= 7 ;

```
`Result = 90020`  
  
for between 7 to 10 miles:  
```sql
SELECT 
	COUNT(*)
FROM public."hw-green"
WHERE 
	lpep_pickup_datetime >= '2019-10-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 7 and trip_distance <= 10 ;
```
`Result = 24074`  
  
for over 10 miles:  
```sql
SELECT 
	COUNT(*)
FROM public."hw-green"
WHERE 
	lpep_pickup_datetime >= '2019-10-01'
	AND lpep_dropoff_datetime < '2019-11-01'
	AND trip_distance > 10;
```
`Result = 32294`
