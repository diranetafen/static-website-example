FROM httpd:latest
RUN apt-get update
RUN apt-get install -y git
EXPOSE 80
RUN git clone https://github.com/carkev/static-website-example.git /var/www/html/
