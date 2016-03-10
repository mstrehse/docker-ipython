FROM ubuntu:14.04
MAINTAINER Maximilian Strehse <max@strehse.eu>

RUN apt-get update && apt-get -yq install \
	pandoc \
	python \
	supervisor \
	wget \
	python-pip \
	python-dev \
	gfortran \
	libopenblas-dev \
	liblapack-dev \
	r-base \
	python-qt4 \
	libfreetype6-dev \
	libxft-dev \
	libjpeg-dev \
	libpng-dev

RUN pip install pip --upgrade && \
	pip install numpy && \
	pip install scipy && \
	pip install nose && \
	pip install mock && \
	pip install sphinx && \
	pip install astropy && \
	pip install biopython && \
	pip install matplotlib && \
	pip install pandas && \
	pip install pylab && \
	pip install scikit-image && \
	picturesp install scikit-learn

RUN pip install pip --upgrade jupyter[all]	
RUN mkdir /notebooks
WORKDIR /notebooks
Expose 8080

VOLUME ["/notebooks"]

EXPOSE 8888
CMD ["jupyter", "notebook"]

