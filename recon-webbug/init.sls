
# Based on
# https://bitbucket.org/ethanr/webbugserver.git
lamp-stack:
  pkg.installed:
    - pkgs:
      - mysql-server
      - php5
      - php-pear
      - php5-mysql

/root/init_db.sql:
  file.managed:
    - source : salt://recon-webbug/init_db.sql

mysql < /root/init_db.sql:
  cmd.run

/var/www/html/webbug.php:
  file.managed:
    - source: salt://recon-webbug/webbugserver/index.php

/var/www/html/1x1.jpg:
  file.managed:
    - source: salt://recon-webbug/webbugserver/1x1.jpg
  
/var/www/html/normalize.css:
  file.managed:
    - source: salt://recon-webbug/webbugserver/normalize.css

/var/www/html/report.php:
  file.managed:
    - source: salt://recon-webbug/webbugserver/report.php
  
#/var/www/html/web_bug.html:
#  file.managed:
#    - source: salt://recon-webbug/webbugserver/web_bug.html

# not really working so I'll just send the script
#webbuguser:
#  mysql_user.present:
#    - host: localhost
#    - password: "LastPizzaToeHorseMarvelous"
#    - connection_user: webbuguser
#    - connection_pass: LastPizzaToeHorseMarvelous
#    - connection_charset: utf8


#create webbug database:
#  mysql_database.present:
#    - name : webbug




