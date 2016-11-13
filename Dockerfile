FROM golang:alpine
RUN apk update
RUN apk add gcc libc-dev libpcap-dev curl
RUN cd /go/bin \    
    && curl https://glide.sh/get | sh \
    && apk del curl


