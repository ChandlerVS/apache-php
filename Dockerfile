FROM ubuntu

MAINTAINER Chandler Van Scoy <chandler@data-head.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt -y install apache2 && \
    apt -y install php libapache2-mod-php && \
    apt -y install php-soap php-mysql php-json \
    php-common php-mbstring php-mysqlnd php-pgsql \
    php-sqlite3 php-redis php-imagick && \
    a2enmod ssl && a2enmod rewrite

RUN apt -y install git unzip curl && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
