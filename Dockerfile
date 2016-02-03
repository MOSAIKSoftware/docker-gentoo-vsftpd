FROM       hasufell/gentoo-amd64-paludis:latest
MAINTAINER Julian Ospald <hasufell@posteo.de>


##### PACKAGE INSTALLATION #####

# copy paludis config
COPY ./config/paludis /etc/paludis

# update world with our USE flags
RUN chgrp paludisbuild /dev/tty && cave resolve -c world -x

# install znc set
RUN chgrp paludisbuild /dev/tty && cave resolve -c vsftpd -x

# update etc files... hope this doesn't screw up
RUN etc-update --automode -5

################################


COPY start.sh /start.sh

RUN mv /etc/vsftpd/vsftpd.conf.example /etc/vsftpd/vsftpd.conf
RUN chmod +x /start.sh

CMD exec /start.sh
