FROM ubuntu:24.04
RUN apt update
RUN apt upgrade -y

RUN apt install -y python3 python3-pip python3-venv pipx git

WORKDIR /
RUN python3 -m venv venv
RUN venv/bin/pip3 install tensorflow
RUN venv/bin/pip3 install numpy
RUN venv/bin/pip3 install pyexiv2
ADD bird.py bird.py
ADD models models
#ADD testImages testImages
ENTRYPOINT ["venv/bin/python3", "bird.py"]
