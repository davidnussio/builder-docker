# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM docker:17.12-git

RUN apk --update add shadow openssh openrc && \
    rc-update add sshd && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" && \
    ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N "" 
    #sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    #mkdir -p /var/run/sshd

# Add locales after locale-gen as needed
# Upgrade packages on image
# Preparations for sshd
# Set user jenkins to the image
RUN useradd -u 9000 -g 999 -m -d /home/jenkins -s /bin/sh jenkins &&\
    echo "jenkins:jenkins" | chpasswd


# Standard SSH port
EXPOSE 22

# Default command
CMD ["/usr/sbin/sshd", "-D"]