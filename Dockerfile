FROM arm32v7/python:3.7.4-alpine
#FROM arm32v7/alpine:3.10

MAINTAINER S Taylor

COPY qemu-arm-static /usr/bin

RUN apk add --no-cache curl

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm/kubectl \
	&& mv kubectl /usr/local/bin \
	&& chmod +x /usr/local/bin/kubectl

# Install awscli
#RUN curl -O https://bootstrap.pypa.io/get-pip.py
#RUN python3 get-pip.py
RUN pip3 install awscli --upgrade

RUN adduser -S user
USER user
WORKDIR /home/user
ENV PATH /usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/user/.local/bin

