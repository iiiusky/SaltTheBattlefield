masscan:
  -pkg.installed


Masscan and dependencies:
  pkg.installed:
    - pkgs:
      - apache2
      - masscan
      - libapache2-mod-php 
      - php-mysqli 
      - php-xml 
      - mysql-server
# Just in case
{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
      - php
{% else %}
      - php5
{% endif %}

/opt/setup_database.sh:
  file.managed:
    - source : salt://recon-masscan/setup_database.sh

mysql masscan < /opt/setup_database.sh:
  cmd.run


Install web interface:
  git.latest:
    - name: https://github.com/offensive-security/masscan-web-ui
    - target: /var/www/html

/var/www/html/config.php
  file.managed:
    - source : salt://recon-masscan/config.php

