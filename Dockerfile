FROM kylemanna/openvpn

MAINTAINER Mesosphere <team@mesosphere.com>

RUN apk -U add \
    bind-tools \
    ca-certificates \
    curl \
    jq \
    py-setuptools \
    python

COPY . /dcos

WORKDIR /dcos
RUN ["/usr/bin/python", "setup.py", "install"]
EXPOSE 5000 1194/tcp 1194/udp
ENTRYPOINT ["/dcos/bin/run.bash" ]
CMD [ "server"]
