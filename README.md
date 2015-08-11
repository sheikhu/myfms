# Docker Compose for Fix My Street

## Prerequisites
* Docker Engine [Ubuntu](https://docs.docker.com/installation/ubuntulinux/),[Mac OS X](https://docs.docker.com/installation/mac) or [Windows](https://docs.docker.com/installation/windows)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Overview
In preparation for deployment of [Fix My Street](http://fixmystreet.org), we decided it would be a great idea to standardize the production environment. To ease this process, we ended up using Docker and Docker Compose.

* Docker is "an open-source project that automates the deployment of applications inside software containers." Essentially, Docker runs a processes from within a container that includes all dependencies the process needs to run. This allows containers to run almost anywhere. For example, you may have a container for running PostgreSQL.

Note: Unfortunately, [you can't run Docker natively in OS X](https://docs.docker.com/installation/mac/), as explained in the Docker documentation

* Docker Compose "allows you to define an application’s components – their containers, configuration, links and volumes – in a single file. Then a single command will set everything up and start your application running." For example, you may use Docker Compose to bundle a web server container and a PostgreSQL container

## Usage

### Start Docker Compose
```
docker-compose up -d
```

There are two Dockerfiles `app` and `nginx` which are built using the `docker-compose build` command. Each Dockerfile can be built individually. The Dockerfiles are built initially when the `docker-compose up -d` command was executed. The Dockerfiles must be rebuilt when changes are made to the files within each of their directory paths.
```
docker-compose build
```

To build a specific Dockerfile use the following
```
docker-compose build <name>
```

Example
```
docker-compose build app
```

The Docker microservices has database container `dalekurt/postgres`. To pull the Docker images

```
docker-compose pull
```

