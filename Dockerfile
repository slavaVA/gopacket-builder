FROM golang:alpine
RUN apk update
RUN apk add gcc libpcap-dev curl
RUN cd /go/bin \    
    && curl https://glide.sh/get | sh \
    && apk del curl


