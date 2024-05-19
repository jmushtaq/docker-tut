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
docker-compose build OR 
docker-compose build web
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

# delete all running containers
docker rm -v $(docker ps --filter status=exited -q)

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
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
postgres=# create database tut_dev;
CREATE DATABASE

postgres=# create extension postgis
postgres=# \q

psql -U dev -h localhost -p 5433 -d tut_dev

PGPASSWORD="<pw>" psql -h db-dev.c9awk6sqcgnn.ap-southeast-2.rds.amazonaws.com -U <pw> -d tut_dev
```

# DB Created by docker-compose.yml
```
docker-compose down
docker-compose build
docker-compose up -d
docker exec -it docker-tut-db-1 bash

psql -h db -U dev -d hello_django_dev

# OR From app:
docker exec -it docker-tut-web-1 bash
./manage.py dbshell

# Volume Mounts
docker-compose ps -a
docker inspect -f "{{ .Mounts }}" docker-tut-db-1
[{volume docker-tut_postgres_data /var/lib/docker/volumes/docker-tut_postgres_data/_data /var/lib/postgresql/data local z true }]
```


# Commnds Ref
```
docker ps (ps -a) --> NNAMES
docker exec -it <name> bash
docker exec -it docker-tut-web-1 bash

docker-compose run --rm web python manage.py makemigrations
docker-compose run --rm web python manage.py migrate
docker-compose run --rm web python manage.py runserver
docker-compose run --rm web python manage.py createsuperuser

docker-compose build
docker-compose stop
docker-compose down (-v | volumes)
docker-compose config

docker-compose up -d --build
docker-compose exec web python manage.py migrate --noinput
`````

Docker Volume Command Ref
```
# create a volume
docker volume create myvolume

# list volums
docker volume ls

# delete a volume
docker volume rm myvolume
```

Ports
```
docker inspect docker-tut-web-1
```

# Copy file between host and continer
```
# container nginx
docker cp nginx:/etc/nginx/conf.d/default.conf .
```

# List images on DockerHub
```
# lists latest tagged images
docker search jmushtaq 

sudo apt install jq

curl -L -s 'https://registry.hub.docker.com/v2/repositories/jmushtaq/disturbance/tags?page=1&page_size=10>' | jq '."results"[]["name"]'

docker search dbcawa 
curl -L -s 'https://registry.hub.docker.com/v2/repositories/dbcawa/das_gis/tags?page=1&page_size=10>' | jq '."results"[]["name"]'
docker pull dbcawa/das_gis:2024.05.01.14.3136

```
