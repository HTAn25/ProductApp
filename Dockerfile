FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*
COPY ProductApp.war /usr/local/tomcat/webapps/ROOT.war
ENV PORT 8080
EXPOSE ${PORT}
RUN sed -i "s/8080/${PORT}/g" /usr/local/tomcat/conf/server.xml
CMD ["catalina.sh", "run"]
