vsftpd:
 pkg: 
  - installed

ftpuser:
 user.present: 
   - fullname: ftpuser
   - shell: /bin/false
   - home: /home/ftpuser
   - password: admin123
   - hash_password: true

deploy vsftpd.conf:
 file.managed:
   - name: /etc/vsftpd.conf
   - source: salt://ftp-server/vsftpd.conf
