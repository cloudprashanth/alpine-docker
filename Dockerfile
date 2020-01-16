FROM alpine
RUN apk --update add openjdk7-jre curl
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O http://apachemirror.wuchna.com/tomcat/tomcat-7/v7.0.99/bin/apache-tomcat-7.0.99.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-7.0.99/* /opt/tomcat/.
COPY tomcat-users.xml /opt/tomcat/conf/
WORKDIR ~/
COPY target/webapp.war /opt/tomcat/webapps/webapp.war 
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
