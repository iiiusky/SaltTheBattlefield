# Install the sun / Oracle JDK from the WEB UPD8 team repo
# Ubuntu tested only.
# From https://github.com/WorkWave/saltstack-formulas/blob/master/oracle-java/init.sls
# --------------------------------------------------

# Automatically accept the oracle license
Accept Oracle Terms:
  debconf.set:
    - name: oracle-java6-installer
    - data:
        'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True }

# Configure apt to use the WEB UPD8 repo
webupd8-repo:
  pkgrepo.managed:
    - humanname: WEB UPD8 Repository
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
    - gpgcheck: 1
    - keyid: EEA14886
    - keyserver: keyserver.ubuntu.com
    - enabled: 1


# Run the installer itself
oracle-java6-installer:
  pkg:
    - installed
    - require:
      - pkgrepo: webupd8-repo
      - debconf: Accept Oracle Terms
