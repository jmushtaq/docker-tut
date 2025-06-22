docker ps

docker-compose build nginx
docker-compose up -d nginx

docker-compose down nginx
docker-compose restart nginx

docker-compose logs

----
www.portchecktool.com
----
192.168.0.50:9001
ubnt:9001
shelley.ddns.net (externally, once confirgured in NOIP.com)

server {
    listen      80 default_server;
    server_name _ ;
    return 503  "No server is currently configured for the requested host." ;
}

server {
    listen 80;
    server_name shelley.ddns.net;

    location / {
        # NOTE: External URL only works for internal container port --> web:8000 (not 9001 !)
        proxy_pass http://web:8000/;
    }
}

server {
    listen 80;
    server_name eventfair.ddns.net;

    location / {
        # NOTE: External URL only works for internal container port --> web2:8000 (not 9002 !)
        proxy_pass http://web2:8000/;
    }
}


