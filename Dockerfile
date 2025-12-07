FROM httpd:2.4-alpine

# Remove default index.html and copy our file
RUN rm -f /usr/local/apache2/htdocs/index.html
COPY index.html /usr/local/apache2/htdocs/index.html
RUN chmod 644 /usr/local/apache2/htdocs/index.html

EXPOSE 80
