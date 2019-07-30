FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server git git-sh
RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd -ms $(which git-shell) git
WORKDIR /home/git
RUN mkdir .ssh && chmod 700 .ssh
ADD authorized_keys .ssh/authorized_keys
RUN chmod 600 .ssh/authorized_keys
RUN chown -R git:git .ssh
RUN mkdir repos && chown -R git:git repos

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
