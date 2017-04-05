msf_user:
  user:
    - name: ahacker
    - present
    - password: TextWellHopeContainsAplha
    - hash_password: true 

https://github.com/rapid7/metasploit-framework.git:
    git.latest:
        - rev: master
        - target: /opt/metasploit-framework

bundle install:
    cmd.run:
      - cwd : /opt/metasploit-framework

/opt/metasploit-framework/database.yml:
    file.managed:
        - user: ahacker
        - group: ahacker
        - mode: 644
        - makedirs: True
        - source: salt://c2-armitage/database.yml

/etc/profile:
    file.append:
        - text: export MSF_DATABASE_CONFIG=/opt/metasploit-framework/database.yml
