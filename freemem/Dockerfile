FROM fedora
COPY free.c /free.c
RUN \
  dnf -y update \
  && dnf -y install \
    gcc
RUN gcc /free.c -o /freemem
CMD ["/freemem"]