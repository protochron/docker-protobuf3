FROM alpine:3.4
MAINTAINER protochron@gmail.com

ARG cores=1
ENV PROTOBUF_TAG v3.0.0

RUN apk add --update curl git go build-base autoconf automake libtool && \
  git clone https://github.com/google/protobuf -b $PROTOBUF_TAG --depth 1 && \
  cd protobuf && \
  ./autogen.sh && \
  ./configure --prefix=/usr && \
  make -j $cores && \
  make check && \
  make install && \
  cd .. && rm -rf protobuf && \
  apk del build-base autoconf automake libtool && \
  rm -rf /var/cache/apk/*

RUN apk --update add libstdc++
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

RUN go get -a github.com/golang/protobuf/protoc-gen-go

CMD protoc
