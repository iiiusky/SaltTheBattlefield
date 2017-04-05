git:
  pkg.installed

python-pip:
  pkg.installed

Offical Empire Project:
  git.latest:
    - name: https://github.com/EmpireProject/Empire.git
    - target: /opt/Empire
    - force_reset : true

# setup config script: https://github.com/EmpireProject/Empire/blob/master/setup/setup_database.py
/opt/Empire/setup/setup_database.py:
  file.managed:
    - source : salt://c2-empire/setup_database.py

# install script (only change is to force installs)
sed -i 's/apt-get install/apt-get -y install/' /opt/Empire/setup/install.sh:
  cmd.run:
    - cwd : /opt/Empire/setup


/opt/Empire/setup/install.sh:
  cmd.run:
    - cwd : /opt/Empire/setup

Run Empire Server:
  cmd.run:
# By it's Self:
#    - name : screen -m -d -S "empire" bash -c "/opt/Empire/empire"
# With Web interface:
    - name : screen -m -d -S "empire" bash -c "/opt/Empire/empire --headless --restport 8080"
    - cwd : /opt/Empire/

Empyre-web dependencies:
  pkg.installed:
    - pkgs:
      - apache2
      - php-pear
{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
      - php
      - php-curl
{% else %}
      - php5
      - php5-curl
{% endif %}

Run Web Interface:
  git.latest:
    - name: https://github.com/interference-security/empire-web.git
    - target: /var/www/html/
    - force: true
    - force_reset : true

apache2:
  service.running:
    - enable : True

