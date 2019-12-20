FROM centos:7
RUN yum install epel-release -y && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && yum install -y httpd git wget sendmail php56w php56w-opcache php56w-gd php56w-interbase php56w-ldap php56w-mbstring php56w-mysql php56w-pdo php56w-soap php56w-xml php56w-pecl-xdebug
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && HASH="$(wget -q -O - https://composer.github.io/installer.sig)" && php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY php.ini /etc/php.ini
RUN yum remove epel-release -y && yum remove wget -y && yum remove all && yum clean all
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80:80
