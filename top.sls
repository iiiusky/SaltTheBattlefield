base:
  '*': 
    - fail2ban
    - ssh.enabled

  'vps119294.vps.ovh.ca':
    - java
    - cobaltstrike
  'rebates-target.com':
    - java
    - cobaltstrike

  'external_ip:144.217.162.255':
    - match : grain
    - socat
    - redirector
  'external_ip:144.217.165.143':
    - match: grain
    - socat
    - redirector
  'external_ip:54.213.244.36':
    - match : grain
    - socat
    - redirector


  'exfil-ftp-*':
    - ftp-server
  'exfil-ftps-*':
    - ftps-server

  'compromised':
    - windows-post-exploit
