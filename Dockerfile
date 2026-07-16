FROM httpd:2.4

RUN rm -rf /usr/local/apache2/htdocs/*
COPY . /usr/local/apache2/htdocs/

RUN sed -i 's/^#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/' /usr/local/apache2/conf/httpd.conf

RUN printf '\n<Directory "/usr/local/apache2/htdocs">\n    AllowOverride All\n    Require all granted\n</Directory>\n' >> /usr/local/apache2/conf/httpd.conf