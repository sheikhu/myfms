FROM stackbrew/ubuntu:14.04
MAINTAINER Dale-Kurt Murray "dalekurt.murray@gmail.com"

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
	make jhead liblocale-gettext-perl perl perlmagick libmath-bigint-gmp-perl \
	gettext ruby1.9.1 postgresql gnuplot ttf-bitstream-vera libexpat1-dev

RUN git clone https://github.com/mysociety/fixmystreet.git /fixmystreet

WORKDIR /fixmystreet

# Install prerequisite Perl modules
RUN bin/install_perl_modules

# Install compass and generate CSS
RUN gem install --user-install --no-ri --no-rdoc bundler
RUN $(ruby -rubygems -e 'puts Gem.user_dir')/bin/bundle install > --deployment --path ../gems --binstubs ../gem-bin
RUN bin/make_css

# Install database schema
psql -U fms fms < db/schema.sql
psql -U fms fms < db/generate_secret.sql
psql -U fms fms < db/alert_types.sql

# Setup config
ADD general.yml /fixmystreet/conf/general.yml
