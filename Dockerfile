FROM centos:7
RUN yum install epel-release -y && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && yum install -y httpd git wget sendmail php56w php56w-opcache php56w-gd
RUN yum remove epel-release -y && yum remove wget -y && yum remove all && yum clean all
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
