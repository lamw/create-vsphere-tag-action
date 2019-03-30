FROM ubuntu

LABEL "com.github.actions.name"="Create vSphere Tag"
LABEL "com.github.actions.description"="Create a new vSphere Tag"
LABEL "com.github.actions.icon"="tag"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/lamw/create-vsphere-tag-action"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="https://github.com/lamw"

ARG GOVC_BINARY=https://github.com/vmware/govmomi/releases/download/v0.20.0/govc_linux_amd64.gz

RUN apt-get -y update
RUN apt-get -y install curl
RUN curl -L $GOVC_BINARY | gunzip > /usr/local/bin/govc
RUN chmod +x /usr/local/bin/govc
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
