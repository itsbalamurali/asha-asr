FROM debian:8
MAINTAINER Balamurali Pandranki <balamurali@live.com>

#Required Dependencies
RUN apt-get update && \
apt-get install -y g++ zlib1g-dev make automake libtool-bin git autoconf && \
apt-get install -y subversion libatlas3-base bzip2 wget python2.7 && \
ln -s /usr/bin/python2.7 /usr/bin/python && \
ln -s -f bash /bin/sh

#Get Kaldi Source code
RUN git clone https://github.com/kaldi-asr/kaldi.git /kaldi --depth=1

RUN cd /kaldi/tools/ && make
RUN cd /kaldi/src && ./configure --shared && make depend && make

ENTRYPOINT ["bin/sh"]