FROM python:3.7
MAINTAINER Lucas M. Sing

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get upgrade -y
#RUN apt-get install python3-opencv python3-scipy python3-numpy -y
#RUN apt-get install -y v4l-utils
COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip -y
RUN pip install cryptography==3.3.2
RUN pip install -r /requirements.txt
RUN mkdir /app
WORKDIR /app
# Copy the app folder from system to docker
COPY ./app /app

RUN export PYTHONPATH='/usr/lib/python3/dist-packages'
ENV PYTHONPATH='/usr/lib/python3/dist-packages'
