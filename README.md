# Run OroCommerce Community Edition Demo in Docker

## Prerequisite

Install [Docker](https://docs.docker.com/engine/install/) with [Docker Compose](https://docs.docker.com/compose/install/).

**Note:** The application uses 80 and 8025 ports, so make sure that other services do not use them.

## Run Application

#### 1. Download Repository With Docker Compose Configuration File 

Check out the git repository:
```bash
git clone https://github.com/oroinc/orocommerce-application-demo-docker.git
cd orocommerce-application-demo-docker
```
Or download the archive file and extract it:
``` bash
wget https://github.com/oroinc/orocommerce-application-demo-docker/archive/master.tar.gz -O - | tar -xzf -
cd orocommerce-application-demo-docker
```

#### 2. Run Application Containers

The configuration is entirely predefined, and you can only change the name of the domain where the application will be located. By default, it is `oro.demo`. If you need to change the domain, create an `.env` file with content `ORO_APP_DOMAIN=my-custom-domain.demo`.

Run containers:
```bash
docker-compose up -d
```

The docker-compose will download the required images and create networks and run containers. To track the logs from the php-fpm container, run `docker-compose logs -f php-fpm`. To get the list of containers, run: `docker-compose ps`.

#### 3. Add a Record to File `/etc/hosts`

```
127.0.0.1 oro.demo
```

#### 4. Open the Application in a Browser

[http://oro.demo](http://oro.demo)

## Access the Mail Catcher

[Smtp service](https://github.com/mailhog/MailHog) is additionally launched so you could send emails from the application. It receives all mail and a web interface that enables you to view it and perform the required actions. The web interface for the mail catcher is available on port `8025`. You can open it by URL http://localhost:8025.

## Stop the Application

- To stop and remove all containers, use the following command: `docker-compose down`.

- To stop and remove all containers with the data saved in volumes, use the following command: `docker-compose down -v`.

## Troubleshooting

- If you deployed the application before, pull up fresh images with `docker-compose pull`.

## About this Project

This repository provides a Docker image designed to set up Docker containers for OroCommerce Community Edition application Demo and docker-compose.yml file to manage the containers.

**This deployment is NOT intended for a production environment.**

**Docker image:** [docker.io/oroinc/commerce-crm-application](https://hub.docker.com/r/oroinc/commerce-crm-application)

One image is used to run containers in several roles: web server, php-fpm, consumer, websocket server, cron service.
All these services must be running, and MySQL database must be prepared for a full-fledged application. An ORO image with the application creates three volumes to keep data:

```
  volumes:
    - config:/var/www/oro_app/config
    - public:/var/www/oro_app/public
    - var:/var/www/oro_app/var
```
