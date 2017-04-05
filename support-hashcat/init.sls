extract hashcat:
  archive.extracted:
    - name: /opt/
    - source: salt://support-hashcat/hashcat-3.40.zip
#    - archive_format: gzip

Hashview Dependencies:
  pkg.installed:
    - pkgs:
      - mysql-server 
      - libmysqlclient-dev 
      - redis-server 
      - openssl 
      - rake
      - ruby
#      - rubygems
      - bundler


/var/www/html/config/database.yml:
  file.managed:
    - source : salt://

#ruby-2.2.2:
#  rvm.installed  
#gem install bundler
#bundle install

Hashview Web interface:
  git.latest:
    - name: https://github.com/hashview/hashview.git
    - target: /var/www/html/hashview

# https://github.com/hashview/hashview/wiki/01_Installing-Hashview

