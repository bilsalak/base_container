########## Pull base image.
FROM bilsalak/base:os_ubuntu_18.04

RUN \
export DEBIAN_FRONTEND=noninteractive && \
########## Update
  apt-get update && \
########## Install Group
  groupadd nobody && \
  usermod -g nobody nobody && \
########## Install Nginx
  apt-get install nginx -y && \
  update-rc.d nginx defaults && \
  update-rc.d nginx enable && \
  chown -R nobody:nobody /var/lib/nginx && \
  chmod -R 777 /var/lib/nginx && \
  chown -R nobody:nobody /run && \
  chmod -R 777 /run && \
  mkdir /home/www-data && \
  chown -R nobody:nobody /home/www-data && \
  chown -R nobody:nobody /var/log/nginx && \
  chmod -R 777 /var/log/nginx && \
  chown -R nobody:nobody /usr/share/nginx && \
  chmod -R 777 /usr/share/nginx && \
########## Install Base PHP
  apt-get install software-properties-common -y && \
  LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
  apt-get update -y && \
  apt-get install php7.3 php7.3-dev php7.3-fpm php7.3-cli -y && \
  touch /var/log/php7.3-fpm.log && \
  chown -R nobody:nobody /var/log/php7.3-fpm.log && \
  chmod -R 777 /var/log/php7.3-fpm.log && \
  mkdir /run/php && \
  chown -R nobody:nobody /run/php && \
  chmod -R 755 /run/php && \
##########
########## Install PHP Curl Extension
##########
  apt-get install php7.3-curl -y && \
##########
########## Install PHP MySQLnd Extension
##########
  apt-get install php7.3-mysqlnd -y && \
##########
########## Install PHP JSON Extension
##########
  apt-get install php7.3-json -y && \
##########
########## Install PHP UUID Extension
##########
  apt-get install php7.3-uuid -y && \
##########
########## Install PHP Couchbase Extension
##########
  apt-get install php7.3-igbinary -y && \
  apt-get install wget -y && \
  wget -O - http://packages.couchbase.com/ubuntu/couchbase.key | apt-key add - && \
  echo "deb http://packages.couchbase.com/ubuntu bionic bionic/main" > /etc/apt/sources.list.d/couchbase.list && \
  apt-get update -y && \
  apt-get install libcouchbase-dev build-essential php-dev zlib1g-dev -y && \
  pecl install couchbase && \
##########
########## Cleanup PHP Extensions
##########
  rm /etc/cron.d/php && \
  rm /etc/php/7.3/fpm/conf.d/20-json.ini && \
  rm /etc/php/7.3/fpm/conf.d/10-pdo.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-calendar.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-ctype.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-exif.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-fileinfo.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-ftp.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-gettext.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-iconv.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-pdo_mysql.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-phar.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-posix.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-readline.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-shmop.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-sysvmsg.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-sysvsem.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-sysvshm.ini && \
  rm /etc/php/7.3/fpm/conf.d/20-tokenizer.ini && \
  rm /etc/php/7.3/cli/conf.d/20-json.ini && \
  rm /etc/php/7.3/cli/conf.d/10-pdo.ini && \
  rm /etc/php/7.3/cli/conf.d/20-calendar.ini && \
  rm /etc/php/7.3/cli/conf.d/20-ctype.ini && \
  rm /etc/php/7.3/cli/conf.d/20-exif.ini && \
  rm /etc/php/7.3/cli/conf.d/20-fileinfo.ini && \
  rm /etc/php/7.3/cli/conf.d/20-ftp.ini && \
  rm /etc/php/7.3/cli/conf.d/20-gettext.ini && \
  rm /etc/php/7.3/cli/conf.d/20-iconv.ini && \
  rm /etc/php/7.3/cli/conf.d/20-pdo_mysql.ini && \
  rm /etc/php/7.3/cli/conf.d/20-phar.ini && \
  rm /etc/php/7.3/cli/conf.d/20-posix.ini && \
  rm /etc/php/7.3/cli/conf.d/20-readline.ini && \
  rm /etc/php/7.3/cli/conf.d/20-shmop.ini && \
  rm /etc/php/7.3/cli/conf.d/20-sysvmsg.ini && \
  rm /etc/php/7.3/cli/conf.d/20-sysvsem.ini && \
  rm /etc/php/7.3/cli/conf.d/20-sysvshm.ini && \
  rm /etc/php/7.3/cli/conf.d/20-tokenizer.ini && \
##########
########## Cleanup
##########
  rm -rf /tmp/* && \
  apt-get clean

COPY nginx_configs/__etc__nginx__nginx.conf /etc/nginx/nginx.conf
COPY nginx_configs/__etc__nginx__conf.d__log_format.conf /etc/nginx/conf.d/log_format.conf
COPY nginx_configs/__etc__nginx__security /etc/nginx/security
COPY nginx_configs/__etc__nginx__fastcgi_params /etc/nginx/fastcgi_params
COPY nginx_configs/__etc__nginx__mime.types /etc/nginx/mime.types
COPY nginx_configs/__etc__nginx__sites-available__default /etc/nginx/sites-available/default
COPY php7.3_configs/__etc__php__7.3__mods-available__couchbase.ini /etc/php/7.3/mods-available/couchbase.ini
COPY php7.3_configs/__etc__php__7.3__fpm__pool.d__www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY php7.3_configs/__etc__php__7.3__fpm__php.ini /etc/php/7.3/fpm/php.ini
COPY php7.3_configs/__usr__lib__tmpfiles.d__php7.3-fpm.conf /usr/lib/tmpfiles.d/php7.3-fpm.conf
COPY startup_manager_configs/__etc__startup_manager.conf /etc/startup_manager.conf

########## Enabling PHP Extensions
RUN \
  cd /etc/php/7.3/fpm/conf.d/ && \
  ln -s /etc/php/7.3/mods-available/json.ini 15-json.ini && \
  ln -s /etc/php/7.3/mods-available/couchbase.ini 20-couchbase.ini && \
  cd /etc/php/7.3/cli/conf.d/ && \
  ln -s /etc/php/7.3/mods-available/json.ini 15-json.ini && \
  ln -s /etc/php/7.3/mods-available/couchbase.ini 20-couchbase.ini

#The uid of the user nobody
USER 65534

EXPOSE 8080

CMD /opt/startup_manager/init.sh