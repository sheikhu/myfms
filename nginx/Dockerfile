FROM tutum/nginx
RUN rm /etc/nginx/sites-enabled/default
ADD sites-enabled/ /etc/nginx/sites-enabled
ADD sysvinit.example /etc/init.d/sysvinit
RUN chmod +x /etc/init.d/sysvinit
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y libfcgi-procmanager-perl \
	&& apt-get clean all \
        && rm -rf /var/lib/apt/lists/*
