FROM parente/ipython:latest

MAINTAINER Maximilian Strehse <max@strehse.eu>

ENV HOME /root

RUN apt-get update && apt-get -yq install \
	pandoc \
	python \
	supervisor \
	wget \
	python-pip 

RUN apt-get update && apt-get -yq install \
	python-dev \
	gfortran \
	libopenblas-dev \
	liblapack-dev \
	r-base \
	python-qt4

RUN apt-get update && apt-get -yq install \
	libfreetype6-dev \
	libxft-dev \
	libjpeg-dev \
	libpng-dev

RUN pip install pip --upgrade && \
	pip install numpy && \
	pip install scipy && \
	pip install nose && \
	pip install mock && \
	pip install sphinx
	

ADD requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt

ADD notebook.conf /etc/supervisor/conf.d/notebook.conf
ADD start.sh /

VOLUME ["/ipy"]

EXPOSE 8888
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

