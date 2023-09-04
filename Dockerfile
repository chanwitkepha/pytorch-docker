FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

ENV HOME=/root
ENV TZ=Asia/Bangkok
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_MESSAGES en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER root
WORKDIR $HOME

RUN apt-get update && apt-get dist-upgrade -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils software-properties-common \ 
	sudo wget vim zip \ 
	unzip traceroute iputils-ping net-tools git-core \
	openssh-server lsb-release curl locales tzdata fonts-thai-tlwg

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen /etc/locale.gen && locale-gen
RUN locale-gen th_TH.UTF-8


#CMD ["/sbin/init"] 
