# Project Setup

```
mkdir app
cd app
touch docker-compose.yml
touch .env

mkdir docker-tut
cd docker-tut/
virtualenv venv 
```

vi requirements.txt 
```
Django==3.2
django-extensions
django-extensions==3.2.3
psycopg2==2.9.9
ipython==8.12.3
```

```
. venv/bin/activate
pip install -r requirements.txt

django-admin startproject hello_django .
./manage.py migrate
./manage.py runserver
```

Navigate to http://localhost:8000/

# Dir Structure
(venv) jawaidm@latitude:/var/www/docker-tut$ tree -a -I 'venv|__pycache__|*.swp'
```
.
├── app
│   ├── db.sqlite3
│   ├── Dockerfile
│   ├── hello_django
│   │   ├── asgi.py
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   ├── manage.py
│   ├── README.md
│   └── requirements.txt
├── docker-compose.yml
└── .env
```

# Build and run docker container
```
cd /var/www/docker-tut
docker-compose build                                                                                                                                                                                        
docker-compose up -d                                                                                                                                                                                        
docker-compose logs -f
```

## Build/Start and run migrations
```
cd var/www/docker-tut
docker-compose up -d --build
docker-compose exec web python manage.py migrate --noinput
```

## Remove the volumes along with the containers
```
docker-compose down -v
```

## Connect to DB shell (if PG started as a postgres DB in container)
```
docker-compose exec db psql --username=hello_django --dbname=hello_django_dev
```

## Check if volume was created
```
docker volume inspect django-on-docker_postgres_data
```

# Create Postgres Database
```
sudo -u postgres psql
postgres=# create database hello_django_dev;
CREATE DATABASE

postgres=# create extension postgis
postgres=# \q

psql -U dev -h localhost -p 5433 -d hello_django_dev
```
