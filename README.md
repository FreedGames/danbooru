### Installation

It is recommended that you install Danbooru on a Debian-based system
since most of the required packages are available on APT. Danbooru
has been successfully installed on Fedora, CentOS, FreeBSD, and OS X.
The INSTALL.debian install script is straightforward and should be
simple to adapt for other platforms.

For best performance, you will need at least 256MB of RAM for
PostgreSQL and Rails. The memory requirement will grow as your
database gets bigger. 

On production Danbooru uses PostgreSQL 9.4, but any 9.x release should
work.

Use your operating system's package management system whenever
possible.  This will simplify the process of installing init scripts,
which will not always happen when compiling from source.

### Troubleshooting

These instructions won't work for everyone. If your setup is not
working, here are the steps I usually recommend to people:

1) Test the database. Make sure you can connect to it using psql. Make
sure the tables exist. If this fails, you need to work on correctly
installing PostgreSQL, importing the initial schema, and running the
migrations.

2) Test the Rails database connection by using rails console. Run
Post.count to make sure Rails can connect to the database. If this
fails, you need to make sure your Danbooru configuration files are
correct.

3) Test Nginx to make sure it's working correctly.  You may need to
debug your Nginx configuration file.

4) Check all log files.

### IQDB Integration

IQDB integration is now delegated to the [IQDBS service](https://github.com/r888888888/iqdbs). 

You will need to install your own copy and enable the appropriate 
configuration settings.

### Listbooru Service

In order to access saved search functionality you will need to install and 
configure the [Listbooru service](https://github.com/r888888888/listbooru).

### Archive Service

In order to access versioned data for pools (and eventually posts) you will 
need to install and configure the [Archives service](https://github.com/r888888888/archives).
