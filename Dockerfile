FROM tomcat:9.0-jdk17

# Xóa app mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR của bạn vào ROOT (truy cập trực tiếp "/")
COPY ProductApp.war /usr/local/tomcat/webapps/ROOT.war

# Render sẽ cấp biến PORT (ví dụ 10000)
ENV PORT=8080
EXPOSE ${PORT}

CMD ["sh", "-c", "sed -i 's/8080/'$PORT'/g' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
