FROM yiisoftware/yii2-php:7.4-fpm

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y \
        librabbitmq-dev libldb-dev libldap2-dev libssh-dev libmemcached-dev \
    && docker-php-ext-install bcmath sockets \
    && docker-php-ext-install ldap \
    && pecl install amqp \
    && pecl install memcached \
    && docker-php-ext-enable amqp \
    && docker-php-ext-enable ldap \
    && docker-php-ext-enable memcached 
    # && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN ln -sf /usr/share/zoneinfo/Europe/Moscow  /etc/localtime \
    && echo "Europe/Moscow" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

# RUN mkdir /opt/oracle
# COPY docker/oracle_instant_client/ /opt/oracle

# ENV LD_LIBRARY_PATH=/usr/lib/oracle/19.6/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
# ENV ORACLE_HOME=/usr/lib/oracle/19.6/client64
# ENV C_INCLUDE_PATH=/usr/include/oracle/19.6/client64/

# RUN apt-get update && \
#     apt-get install --no-install-recommends --assume-yes --quiet \
#         rpm \
#         libaio1 \
#         alien \
#         build-essential \
#         apt-transport-https \
#         libmcrypt-dev \
#         zlib1g-dev \
#         libxslt-dev \
#         libpng-dev && \
#     rm -rf /var/lib/apt/lists/* && \
#     alien -i /opt/oracle/oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm && \
#     alien -i /opt/oracle/oracle-instantclient19.6-devel-19.6.0.0.0-1.x86_64.rpm && \
#     echo "/usr/lib/oracle/19.6/client64/lib/" > /etc/ld.so.conf.d/oracle.conf && \
#     chmod o+r /etc/ld.so.conf.d/oracle.conf && \
#     ln -s /usr/include/oracle/19.6/client64 $ORACLE_HOME/include && \
#     docker-php-ext-install pdo oci8 pdo_oci && \
#     rm -rf /opt/oracle

RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Add custom php.ini
# ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini
 
WORKDIR /var/www/html
 
CMD ["php-fpm"]