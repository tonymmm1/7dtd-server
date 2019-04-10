FROM debian
RUN echo 'Acquire::http::Proxy "http://10.0.1.125:3142";' > /etc/apt/apt.conf.d/02proxy && apt-get update -y && apt-get install xmlstarlet -y && apt-get install vim -y && apt-get install lib32gcc1 -y  && apt-get install lib32stdc++6 -y && apt-get install make -y  && apt-get install gcc -y && mkdir -p /home/sdtd && mkdir -p /home/sdtd/backup && mkdir -p /usr/local/bin/7dtd.sh && mkdir -p /usr/local/lib/7dtd && mkdir -p /etc/7dtd.conf && mkdir -p /etc/bash_completion.d/7dtd && mkdir -p /etc/cron.d/7dtd-backup && mkdir -p /etc/init.d/7dtd.sh && useradd -d /home/sdtd -m -r -s /bin/bash -U sdtd && apt-get install wget -y && wget http://illy.bz/fi/7dtd/management_scripts.tar.gz && tar --touch -xvzf management_scripts.tar.gz -C / && update-rc.d 7dtd.sh defaults && cd /usr/local/lib/7dtd/start-stop-daemon && make && gcc -o start-stop-daemon start-stop-daemon.c && make install && chown root.root start-stop-daemon && chmod 0755 start-stop-daemon && chown root.root /etc/7dtd.conf && chmod 0600 /etc/7dtd.conf && chown sdtd.sdtd /home/sdtd -R && chown root.root /etc/init.d/7dtd.sh && chown root.root /etc/bash_completion.d/7dtd && chown root.root /usr/local/bin/7dtd.sh && chown root.root /usr/local/lib/7dtd -R && chmod 0755 /etc/init.d/7dtd.sh && chmod 0755 /etc/bash_completion.d/7dtd && chmod 0755 /usr/local/bin/7dtd.sh && chmod 0755 /usr/local/lib/7dtd -R && printf 'y\ny\ny\n\n' | 7dtd.sh updateengine  && printf 'y' | 7dtd.sh updatefixes && printf 'y' | 7dtd.sh updatescripts
COPY setup.sh
CMD ./setup.sh


#Remove proxy 

