ftpuser:
 user.present:
   - fullname: ftpuser
   - shell: /bin/false
   - home: /home/ftpuser
   - password: admin123
   - hash_password: true

/etc/ssl/private/vsftpd.pem:
  file.managed:
    - source: salt://ftps-server/vsftpd.pem


/etc/ssl/private/vsftpd.key:
  file.managed:
    - source: salt://ftps-server/vsftpd.key

/etc/vsftpd.conf:
  file.managed:
    - source: salt://ftps-server/vsftpd.conf

vsftpd:
  pkg.installed: []
  service.running:
   - watch:
     - file: /etc/vsftpd.conf
   - require: 
     - pkg: vsftpd
#   - enable: True
#   - reload: True


#deploy vsftpd.conf:
# file.managed:
#   - name: /etc/vsftpd.conf
#   - source: salt://ftps-server/vsftpd.conf

