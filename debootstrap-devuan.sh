

  date
  cp debootstrap-devuan.sh         /opt/
  cp debootstrap-devuan.sh         /root/
  cp /boot/debootstrap-devuan.sh   /root/

  echo debootstrap devuan
  apt-get update ; apt-get install debootstrap -y 
  mkdir /target
  pwd 

# probably you dont want apple, systemd, wayland, redhat, nsa, android, microsoft.... in your computer....
#  debootstrap  --no-check-gpg     --include=netbase,wpasupplicant  testing   .   http://ftp.debian.org/debian/  

  PKG="wpasupplicant,netbase,tcc,login,passwd"
  echo ===========================
  echo ThePackagesList-"$PKG"
  echo ===========================
# debootstrap   --no-check-gpg  --include="$PKG" --arch i386 jessie  /target  http://auto.mirror.devuan.org/merged/
# debootstrap   --no-check-gpg  --include="$PKG" --arch i386 ascii  /target  http://auto.mirror.devuan.org/merged/
  echo run-debootstrap-start
  debootstrap   --no-check-gpg  --include="$PKG" --arch i386 ascii  /target  http://be.deb.devuan.org/merged 
 

  date
  mkdir /target/lib/modules
  mkdir /target/media/pendrive 
  mkdir /target/media/sda1
  mkdir /target/media/sdb1

  echo 
  cp -v  /etc/network/interfaces  /target/etc/network/
  cp -v  /etc/network/wifi.conf   /target/etc/network/
  cp -v  /etc/wifi.conf   /target/etc/wifi.conf 

  echo 
  cp -v  /usr/local/bin/nexplorer    /target/usr/local/bin/ 
  cp -v  /usr/local/bin/ndesk    /target/usr/local/bin/ 
  cp -v  /usr/local/bin/nconfig     /target/usr/local/bin/ 
  cp -v  /usr/local/bin/nswiss        /target/usr/local/bin/ 
  cp -v  /usr/local/bin/onc           /target/usr/local/bin/ 

  echo 

  echo "" > /target/etc/fstab 
  mv /target/boot       /target/boot-origin
  cp -v source/base/nconfig.c  /opt/

# cp -a  /boot/   /target/
# lc should have an editor with --edit  or -e 
date
if [ -f /usr/bin/vim ] ; then 
     vim       /target/etc/shadow
 else
    vim.tiny  /target/etc/shadow
fi
date

# copy a rescue filesystem squashfs to boot to ram.
#  echo Copy Live
#  cp -a /live/  /target/

  echo please do place boot and modules now 
  echo Copy Boot
  cp -a /boot/        /target 
  echo Copy Kernel and Modules
  cp -a -v /lib/modules/4.9.0-6-686-pae  /target/lib/modules/
  cp -a -v /lib/modules/4.9.0-6-686      /target/lib/modules/
  echo modules done 
  cp /root/debootstrap-devuan.sh   /target/boot/
  cp /root/debootstrap-devuan.sh   /target/root/
  echo mission completed
  date

exit


deb http://be.deb.devuan.org/merged ascii main non-free contrib
deb-src http://be.deb.devuan.org/merged ascii main non-free contrib

deb http://be.deb.devuan.org/merged ascii-security main non-free contrib
deb-src http://be.deb.devuan.org/merged ascii-security main non-free contrib

deb http://be.deb.devuan.org/merged ascii-updates main non-free contrib
deb-src http://be.deb.devuan.org/merged ascii-updates main non-free contrib

