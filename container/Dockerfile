FROM almalinux:8

COPY --chmod=755 *.sh *.pl /scripts/

ENV TRAINING_USER="________"
ENV INITITAL_PW="________"

# initializing
RUN chmod 755 /scripts/create-dirs-script.sh; \
    # add repo and packages like htop
    dnf install -y epel-release \
    # updating packages
    && dnf check-update; dnf update -y; dnf install -y coreutils-common \
    # install ssh server
    && dnf install -y openssh-server openssh-clients; \
    # install base tools (passwd man pstree )
    dnf install -y passwd shadow-utils glibc-langpack-en man less vim fortune-mod cowsay sudo procps-ng psmisc htop \
    # add user and set password
    && useradd -m -s /bin/bash $TRAINING_USER \
    && echo "$INITITAL_PW" | passwd --stdin shell-training \
    # adding user to sudoers (no passwd needed)
    && echo "shell-training ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# creating host key files
RUN ssh-keygen -b 4096 -f /etc/ssh/ssh_host_rsa_key -t rsa -N ""; \
    ssh-keygen -b 1024 -f /etc/ssh/ssh_host_dsa_key -t dsa -N ""; \
    ssh-keygen -b  521 -f /etc/ssh/ssh_host_ecdsa_key -t ecdsa -N ""; \
    ssh-keygen -b 4096 -f /etc/ssh/ssh_host_ed25519_key -t ed25519 -N ""; \
    chmod 600 /etc/ssh/*key 2>&1

# add /scripts to PATH for all users
RUN echo "PATH=/scripts:$PATH" >> /etc/bashrc

USER shell-training
RUN /scripts/create-dirs-script.sh

USER root
CMD ["/usr/sbin/sshd", "-D"]