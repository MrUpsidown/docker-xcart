FROM webdevops/php-apache:7.1

MAINTAINER A. Marquis <mrupsidown@gmail.com>

RUN apt-get update
RUN apt-get install -y curl nano git

# RUN mkdir -p /usr/local/etc/php/conf.d/
RUN curl --location --output /usr/local/bin/mhsendmail https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 && \
    chmod +x /usr/local/bin/mhsendmail

# Copy additional ini file
COPY ./conf/xcart.ini /usr/local/etc/php/conf.d/xcart.ini

EXPOSE 80 443 3306