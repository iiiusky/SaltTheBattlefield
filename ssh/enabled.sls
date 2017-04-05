ssh:
  pkg.installed:
    - name: openssh-server
  service.running:
    - require:
      - pkg: openssh-server
      - ssh_auth: master_pubkey

master_pubkey:
  ssh_auth.present:
    - user: root
    - source: salt://ssh/id_rsa.pub
