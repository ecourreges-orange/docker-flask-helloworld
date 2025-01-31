FROM ubuntu:latest

MAINTAINER Rustam Mehmandarov – mehmandarov.com

RUN set -ex \
  	&& sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://no.archive.ubuntu.com/ubuntu/%g" /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y \
 			python3-pip \
 			python3-dev \
 			build-essential \
 	&& apt-get clean \
 	&& rm -rf /var/lib/apt/lists/* \
 	&& pip install --upgrade pip

ENV APPPATH /opt/myflaskapp
COPY . $APPPATH
WORKDIR $APPPATH/app
RUN pip install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["src/app.py"]
