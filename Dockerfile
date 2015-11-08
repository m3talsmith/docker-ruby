FROM ubuntu:15.10
MAINTAINER Michael Christenson II <m3talsmith@gmail.com>

RUN apt-get update && apt-get install -yq \
  build-essential\
  python-software-properties\
  git\
  imagemagick libmagickcore-dev libmagickwand-dev\
  libyaml-dev\
  libssl-dev\
  wget

RUN mkdir /src && cd /src && \
  wget http://xyz.lcs.mit.edu/ruby/ruby-1.9.3-p448.tar.gz

WORKDIR /src
RUN tar -zxvf ruby-1.9.3-p448.tar.gz

WORKDIR /src/ruby-1.9.3-p448
RUN ./configure
RUN make && make install
RUN ruby ./ext/openssl/extconf.rb

RUN gem install bundler --no-ri --no-rdoc
