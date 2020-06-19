FROM centos:7
RUN yum install epel-release -y && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && yum install -y httpd wget sendmail php56w php56w-opcache php56w-gd php56w-interbase php56w-mbstring php56w-mysql php56w-pdo php56w-soap php56w-xml openssl mod_ssl
RUN yum remove epel-release -y && yum remove wget -y && yum remove all && yum clean all
WORKDIR /var/www/html
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
