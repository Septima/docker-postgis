FROM debian:stretch
RUN apt-get update -qq && apt-get install -y \
          postgresql-9.6 postgresql-server-dev-9.6 \
          build-essential autoconf libtool \
          libproj-dev libgdal-dev libgeos-dev \
          libprotobuf-c-dev protobuf-c-compiler \
          curl

RUN service postgresql start && su -l postgres -c "createuser -s `whoami`"

RUN curl --silent -L \
  https://github.com/postgis/postgis/archive/19a4903f10af2248553c83c27743c830b82f9ab5.tar.gz | \
  tar xz && cd postgis-19a4903f10af2248553c83c27743c830b82f9ab5 && \
  ./autogen.sh && \
  ./configure --without-address-standardizer --without-raster --without-topology && make && make install && \
  cd .. && rm postgis-19a4903f10af2248553c83c27743c830b82f9ab5 -rf
