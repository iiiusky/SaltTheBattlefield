git:
  pkg.installed

python-pip:
  pkg.installed

Offical Empire Project:
  git.latest:
    - name: https://github.com/EmpireProject/EmPyre.git
    - target: /opt/EmPyre
    - force_reset : true
# if you want to run the dev branch uncomment the next line
#    - rev: dev

# setup config script: https://github.com/EmpireProject/EmPyre/blob/master/setup/setup_database.py
/opt/EmPyre/setup/setup_database.py:
  file.managed:
    - source : salt://c2-empyre/setup_database.py

# install script (only change is to force installs)
sed -i 's/apt-get install/apt-get -y install/' /opt/EmPyre/setup/install.sh:
  cmd.run:
    - cwd : /opt/EmPyre/setup


/opt/EmPyre/setup/install.sh:
  cmd.run:
    - cwd : /opt/EmPyre/setup

Run EmPyre Server:
  cmd.run:
# By it's Self:
#    - name : screen -m -d -S "empyre" bash -c "/opt/EmPyre/empyre"
# With Web interface:
    - name : screen -m -d -S "empyre" bash -c "/opt/EmPyre/empyre --headless --restport 8080"
    - cwd : /opt/EmPyre/

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
    - name: https://github.com/interference-security/empyre-web.git
    - target: /var/www/html/
    - force: True
    - force_reset : true

apache2:
  service.running:
    - enable : True

