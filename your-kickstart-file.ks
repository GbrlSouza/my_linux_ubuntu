#version=RHEL7
install
cdrom
lang en_US.UTF-8
keyboard us
timezone --utc America/Sao_Paulo
rootpw --iscrypted $6$rounds=656000$S8LmDzhs9vCO7.xm$...
user --name=gbrlsouza --password=Gbrl_019
reboot
%packages
@core
%end