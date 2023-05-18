FROM debian

RUN apt-get update && apt-get install apache2 -y && apt-get clean

ENV APACHE_LOCK_DIR = "/var/lock/apache2"
ENV APACHE_PID_FILE = "/var/run/apache2.pid"
ENV APACHE_RUN_USER = "www-data"
ENV APACHE_RUN_GROUP = "www-data"
ENV APACHE_LOG_DIR = "/var/log/apache2"

ADD site.tar /var/www/html

LABEL description = "Apache webserver 1.0"

VOLUME /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl"]

CMD ["-D", "FOREGROUND"]