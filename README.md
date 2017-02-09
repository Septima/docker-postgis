# docker-postgis

Experimental Dockerfile to create an image with the following properties:

* Debian Stretch
* PostgreSQL 9.6
* PostGIS svn-trunk specific commit build
* PostgreSQL running as a service

## Running and external access

Use something like `docker run -t -i -p 15432:5432`, change postgresql.conf and pg_hba.conf to allow the connection.
