FROM  ubuntu
MAINTAINER Ramon Brooker <rbrooker@aetherealmind.com> 

ENV DEBIAN_FRONTEND noninteractive
# for setting

LABEL crystal_version="0.17.0" 
LABEL llvm_version="" 


RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54;   echo "deb http://dist.crystal-lang.org/apt crystal main" > /etc/apt/sources.list.d/crystal.list
RUN apt-get update; apt-get install crystal
# clean extra-files 
RUN  apt-get autoremove -y ; apt-get clean && rm -rf /var/lib/apt/lists/*

ADD set-time.sh  /set-time.sh
RUN  /set-time.sh


VOLUME ["/scrpts"]

CMD ["/bin/bash"] 

