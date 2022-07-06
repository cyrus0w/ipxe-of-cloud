#!/bin/bash
rootPWD="$6$y0xn3L3IaYfFs9Qn$KZMpMOwuznp4sdIe49DHRW/q5SZNXStoRFMASH9vVeyir03mLiowEN461RZ7iKdXQkJivOkYfMz11tYGArJNr/"  # sha-512
opsPWD="$6$U1I/krNjRD3H4pQl$aoIUYCElP5ZU6UOCqcyVvCpyERm2D1a5A0KN4kajKpEbKgOsrFvZN6eAVh8VeUqvmc/WFSbZc4AFqccw2rGO40"  # sha-512
grubPWD="$1$mWzi29hm$rsEYxvTvd4IKS02nQZVZb/"  # md5
netconsolePWD="123456"  # text
netconsoleKEY="http://gitee.com/cyrus0w/ipxe-of-cloud/raw/main/public_installer/authorized_keys"  # authorized_keys 
echo "d-i passwd/root-password-crypted password ${rootPWD}" > /tmp/password.cfg
echo "di passwd/user-password-crypted password ${opsPWD}" >> /tmp/password.cfg
echo "d-i grub-installer/password-crypted password ${grubPWD}" >> /tmp/password.cfg
echo "d-i network-console/password password ${netconsolePWD}" >> /tmp/password.cfg
echo "d-i network-console/password-again password ${netconsolePWD}" >> /tmp/password.cfg
echo "d-i network-console/authorized_keys_url ${netconsoleKEY}" >> /tmp/password.cfg
# add´s values to /var/lib/cdebconf/question.dat
debconf-set-selections /tmp/password.cfg