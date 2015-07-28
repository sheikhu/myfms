FROM stackbrew/ubuntu:14.04
MAINTAINER Dale-Kurt Murray "dalekurt.murray@gmail.com"

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
	make jhead liblocale-gettext-perl perl perlmagick libmath-bigint-gmp-perl \
	gettext ruby1.9.1 postgresql gnuplot ttf-bitstream-vera libexpat1-dev \
	&& apt-get clean all \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mysociety/fixmystreet.git /fms

WORKDIR /fms

# Install prerequisite Perl modules
RUN bin/install_perl_modules

# Install compass and generate CSS
RUN gem install --user-install --no-ri --no-rdoc bundler
RUN $(ruby -rubygems -e 'puts Gem.user_dir')/bin/bundle install > --deployment --path ../gems --binstubs ../gem-bin
RUN bin/make_css

# Install database schema
RUN psql -h db -U fms fms < db/schema.sql
RUN psql -h db -U fms fms < db/generate_secret.sql
RUN psql -h db -U fms fms < db/alert_types.sql

# Setup config
ADD general.yml /fms/conf/general.yml


EXPOSE 9000
