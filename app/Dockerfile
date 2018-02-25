FROM ubuntu:14.04
LABEL Dale-Kurt Murray "dalekurt.murray@gmail.com"

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q git

RUN locale-gen en_US.utf8 && \
	cachebuster=b953b35 git clone --recursive https://github.com/mysociety/fixmystreet.git


WORKDIR /fixmystreet

# Install packages
# RUN xargs -a conf/packages.ubuntu-precise apt-get install -y -q
RUN xargs -a conf/packages.generic apt-get install -y -q
RUN apt-get install -y language-pack-fr
# Install prerequisite Perl modules
RUN bin/install_perl_modules

ENV LANG fr_FR.UTF-8
# Install compass and generate CSS
# RUN gem install --user-install --no-ri --no-rdoc bundler
# RUN $(ruby -rubygems -e 'puts Gem.user_dir')/bin/bundle install --deployment --path ../gems --binstubs ../gem-bin
RUN bin/make_css

# Copy shell script
ADD install-database.sh /tmp/install-database.sh
RUN chmod +x /tmp/install-database.sh
ADD pgpass /root/.pgpass
RUN chmod 0600 /root/.pgpass



# Reports
#RUN bin/update-all-reports

# Setup config
ADD general.yml /fixmystreet/conf/general.yml

EXPOSE 3000

CMD ["/bin/bash"]
ENTRYPOINT ["script/fixmystreet_app_server.pl", "-d", "--fork"]
