# Install the Cobalt Strike server, dependencies, and get it up and running


# download CS - I think the below untar makes this redundant
#/opt/cobaltstrike-trial.tgz:
#  file.managed:
#    - source: salt://cobaltstrike/cobaltstrike-trial.tgz
#    - user: root
#    - group: root
#    - mode: 644	
# untar/gzip
# tar zxvf /opt/cobaltstrike-trial.tgz
extract_cobaltstrike:
  archive.extracted:
    - name: /opt/
#    - archive_format: gzip
    - source: salt://cobaltstrike/cobaltstrike-trial.tgz
    - user: root
    - group: root

# send license	
/root/.cobaltstrike.license:
  file.managed:
    - source: salt://cobaltstrike/.cobaltstrike.license
    - user: root
    - group: root
    - mode: 644

# update CS
/opt/cobaltstrike/update:
  cmd.run:
    - cwd: /opt/cobaltstrike

# run team server
# to get IP I should use network.ip_addrs... but 'curl icanhazip.com' is easier
screen -m -d -S "cs" bash -c "sudo /opt/cobaltstrike/teamserver $(curl -s icanhazip.com) herecomestheboom!":
  cmd.run:
    - cwd: /opt/cobaltstrike
