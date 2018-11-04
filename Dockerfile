FROM tomcat:8.0

ADD ./webapp/target/webapp.war /user/local/tomcat/webapps/

EXPOSE 8080

CMD [ "catalina.sh", "run" ]