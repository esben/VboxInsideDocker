# VirtualBox 4.3.x service
#
# VERSION               0.0.1

FROM rastasheep/ubuntu-sshd:14.04
MAINTAINER Esben Haabendal <esben@haabendal.dk>

ENV DEBIAN_FRONTEND noninteractive

# Install VirtualBox
RUN wget -nv http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
RUN echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list
RUN apt-get update && apt-get install -y virtualbox-4.3 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Virtualbox Extension Pack
RUN VBOX_VERSION=`dpkg -s virtualbox-4.3 | grep '^Version: ' | sed -e 's/Version: \([0-9\.]*\)\-.*/\1/'` ; \
    wget http://download.virtualbox.org/virtualbox/${VBOX_VERSION}/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack ; \
    VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack ; \
    rm Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack

# The virtualbox driver device must be mounted from host
VOLUME /dev/vboxdrv

RUN wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb && dpkg -i vagrant_1.7.2_x86_64.deb && rm vagrant_1.7.2_x86_64.deb
