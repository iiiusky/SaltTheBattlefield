Netcats:
  pkg.installed:
    - pkgs:
      - nc

Start 80 Lister:
  cmd.run:
    - name : screen -m -d -S "nc_listener" bash -c "while true; do nc -l -p 80; done"

Start 443 Listener:
  cmd.run:
    - name : screen -m -d -S "nc_listener" bash -c "while true; do nc -l -p 443; done"

