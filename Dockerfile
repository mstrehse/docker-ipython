FROM parente/ipython:latest

MAINTAINER Maximilian Strehse <max@strehse.eu>

ENV HOME /root

RUN pip install pip --upgrade

RUN pip install numpy
RUN pip install scipy

ADD requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt

ADD notebook.conf /etc/supervisor/conf.d/notebook.conf
ADD start.sh /

VOLUME ["/ipy"]

EXPOSE 8888
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

