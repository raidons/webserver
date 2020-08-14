FROM centos:7
RUN yum install -y  epel-release -y
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y  yum-utils 
RUN yum-config-manager --enable remi-php74 
RUN yum -y update \
    && yum install -y httpd wget sendmail php php-opcache php-gd php-pecl-interbase php-mbstring php-mysqlnd php-pdo php-soap php-xml openssl mod_ssl \
    && yum remove epel-release -y && yum remove wget -y && yum remove all && yum clean all
WORKDIR /var/www/html
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80