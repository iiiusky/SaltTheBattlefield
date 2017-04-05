apache2:
  pkg:
    - installed

  service.running:
    - enable: True


git:
  pkg.installed

Pull down the common kali binaries:
  git.latest:
    - name: https://github.com/interference-security/kali-windows-binaries.git
    - target: /var/www/html/windows

Pull down the common binaries from Mubix:
  git.latest:
    - name: https://github.com/mubix/post-exploitation.git
    - target: /var/www/html/windows/mubix

Pull down useful Powershell Scripts:
  git.latest:
    - name: https://github.com/PowerShellMafia/PowerSploit.git
    - target: /var/www/html/windows/powershell

Pull down useful Linux Enumeration & Privilege Escalation Script:
  git.latest:
    - name: https://github.com/rebootuser/LinEnum.git
    - target: /var/www/html/linux/LinEnum 

Pull down another useful Linux Enumeration & Privilege Escalation Script:
  git.latest:
    - name: https://github.com/PenturaLabs/Linux_Exploit_Suggester.git
    - target: /var/www/html/linux/ExploitSuggester

Pull down yet another useful Linux Enumeration & Privilege Escalation Script:
  git.latest:
    - name: https://github.com/pentestmonkey/unix-privesc-check.git
    - target: /var/www/html/linux/UnixPrivEsc

/var/www/html/index.html:
  file.managed:
  - source: salt://payload-host/index.html

/var/www/html/hosted.sh:
  file.managed:
  - source: salt://payload-host/once.sh
