# gopacket-builder
gopacket-builder image is designed for gopacket packet build automation in Docker/Rkt environment.

The following dependencies added in base golang:alpine image:
- gcc 
- libc-dev
- libpcap-dev
- glide

GOROOT and GOPATH environment variables left without changes.

## Using with Docker

See [the Docker Hub page](https://registry.hub.docker.com/_/golang/) for the full readme on how to use this Docker image and for information regarding contributing and issues.

The full readme is generated over in [docker-library/docs](https://github.com/docker-library/docs), specifically in [docker-library/docs/golang](https://github.com/docker-library/docs/tree/master/golang).

## Using with Rkt

### Image fetch
```
   $ sudo rkt fetch quay.io/slavava/gopacket-builder

   $ sudo rkt image list
    ID                      NAME                                            SIZE    IMPORT TIME     LAST USED
    sha512-06f456e69e75     coreos.com/rkt/stage1-coreos:1.8.0              163MiB  2 weeks ago     2 weeks ago
    sha512-0069d46f0fbf     quay.io/slavava/gopacket-builder:latest         687MiB  4 minutes ago   4 minutes ago
```

### Build Go app inside container
```
   $ sudo rkt run --volume src,kind=host,source=$PWD,readOnly=false \
        quay.io/slavava/gopacket-builder \
        --mount volume=src,target=/go \
        --inherit-env --set-env=CGO_ENABLED=0 \
        --exec go -- build -o hello -a -tags netgo -ldflags -w . 
```
### Run command inside container
```
   $sudo rkt run quay.io/slavava/gopacket-builder --interactive --exec /bin/sh
```

## Using with "Drone.io"

For build application using gopacket you should create file .drone.yml in root of your project with following content:
```
clone:
 path: github.com/google/gopacket
build:
 image: quay.io/slavava/gopacket-builder
 commands:
   - go install github.com/google/gopacket/examples/httpassembly
```
String "go install github.com/google/gopacket/examples/httpassembly" is used for example of build httpassembly from packet examples.