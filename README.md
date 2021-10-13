# Run Oro Application Demo in Docker

## Prerequisite

Install [Docker](https://docs.docker.com/engine/install/) with [Docker Compose](https://docs.docker.com/compose/install/).

**Note:** The application uses 80 and 8025 ports, so make sure that other services do not use them.

## Run Application

#### 1. Download Repository With Docker Compose Configuration File

Check out the git repository:
```bash
git clone https://github.com/oroinc/docker-demo.git
cd docker-demo
```
Or download the archive file and extract it:
```bash
wget https://github.com/oroinc/docker-demo/archive/master.tar.gz -O - | tar -xzf -
cd docker-demo
```

#### 2. Run Application Containers

The configuration is entirely predefined, and you can only change the name of the domain where the application will be located. By default, it is `oro.demo`. If you need to change the domain, create an `.env` file with content `ORO_APP_DOMAIN=my-custom-domain.demo`.

Run containers:
```bash
docker-compose up -d
```

The docker-compose will download the required images, create networks and run containers.
Application `commerce-crm-application` is used by default.
You can run other community applications, such as `crm-application`, `platform-application` or `commerce-crm-application-de`.
To select another application, set a different image in `.env` file, for example:
```bash
ORO_IMAGE=docker.io/oroinc/crm-application
```
Alternatively, you can set a variable before the docker-compose command without creating the `.env` file:
```bash
ORO_IMAGE=docker.io/oroinc/crm-application docker-compose up -d
```
You can also select a different tag (version). For example, set variable `ORO_APP_VERSION=4.2` in `.env` or in the command line.

To track the logs from the php-fpm container, run `docker-compose logs -f php-fpm`. To get the list of containers, run: `docker-compose ps`.

#### 3. Add a Record to File `/etc/hosts`

```
127.0.0.1 oro.demo
```

#### 4. Open the Application in a Browser

Now, you can open URL [http://oro.demo](http://oro.demo) in your browser.

To access the back-office, use *admin* as both login and password.
To access the storefront, use credentials of the predefined demo user roles. To log in as a buyer, use *BrandaJSanborn@example.org* both as your login and password. To log in a manager, use *AmandaRCole@example.org* both as your login and password.

## Access the Mail Catcher

[Smtp service](https://github.com/mailhog/MailHog) is additionally launched so you could send emails from the application. It receives all mail and a web interface that enables you to view it and perform the required actions. The web interface for the mail catcher is available on port `8025`. You can open it by URL http://localhost:8025.

## Stop the Application

- To stop and remove all containers, use the following command: `docker-compose down`.

- To stop and remove all containers with the data saved in volumes, use the following command: `docker-compose down -v`.

## Troubleshooting

- If you deployed the application before, pull up fresh images with `docker-compose pull`.

## About this Project

This repository provides a Docker Compose configuration file (docker-compose.yaml) and demonstrate how you can run different applications + required services in containers. Oro Inc. provide images with applications Community Edition in public Docker Hub.

**This deployment is NOT intended for a production environment.**

**Docker images with different applications:**
OroCommerce Community Edition: [docker.io/oroinc/commerce-crm-application](https://hub.docker.com/r/oroinc/commerce-crm-application)
OroCRM Community Edition: [docker.io/oroinc/crm-application](https://hub.docker.com/r/oroinc/crm-application)
OroPlatform Community Edition: [docker.io/oroinc/platform-application](https://hub.docker.com/r/oroinc/platform-application)
OroCommerce Community Edition for Germany: [docker.io/oroinc/commerce-crm-application-de](https://hub.docker.com/r/oroinc/commerce-crm-application-de)


One image is used to run containers in several roles: web server, php-fpm, consumer, websocket server, cron service.
All these services must be running, and MySQL database must be prepared for a full-fledged application.
