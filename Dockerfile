FROM centos:7
RUN yum install -y  epel-release -y \
    && yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum install -y  yum-utils \
    && yum-config-manager --enable remi-php74 \
    && yum -y update \
    && yum install -y httpd wget sendmail php php-opcache php-gd php-pecl-interbase php-mbstring php-mysqlnd php-pdo php-soap php-xml php-pecl-zip openssl mod_ssl php_posix intl git \
    && yum remove epel-release -y && yum remove wget -y && yum remove all && yum clean all
WORKDIR /var/www/html
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80