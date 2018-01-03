FROM alpine:3.2

# ENV PORT="8082" \
ENV	GOROOT=/usr/lib/go \
    GOPATH=/gopath \
    GOBIN=/gopath/bin \
    PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Make the source code path
RUN mkdir -p /gopath/src/Stream-golang

WORKDIR /gopath/src/Stream-golang
ADD . /gopath/src/Stream-golang

RUN apk add -U git go && \
  cd /gopath/src/Stream-golang && \
  go get github.com/gorilla/mux &&\
  go get github.com/gocql/gocql &&\
  go get github.com/GetStream/stream-go &&\
  go install &&\
  	apk del git go && \
  	rm -rf /var/cache/apk/*

# Indicate the binary as our entrypoint
ENTRYPOINT /gopath/bin/Stream-golang

#Our app runs on port 8080. Expose it!
EXPOSE 8080
