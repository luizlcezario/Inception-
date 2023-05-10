FROM debian:buster

ARG FTP_USER
ARG FTP_PASS
ARG FTP_DOMAIN

RUN apt-get update && apt-get install -y vsftpd

COPY ./conf /etc/

RUN mkdir -p /home/$FTP_USER
RUN useradd $FTP_USER --home /home/$FTP_USER --shell /bin/bash
RUN mkdir -p /var/run/vsftpd/empty

RUN usermod -aG www-data $FTP_USER

RUN echo "$FTP_USER:$FTP_PASS" | chpasswd

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]