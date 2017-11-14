FROM golang:alpine as builder

ADD ./main.go /go/src/github.com/gofmt/project/main.go
# ADD ./lib /go/src/github.com/gofmt/project/lib
# ADD ./vendor /go/src/github.com/gofmt/project/vendor

WORKDIR /go/src/github.com/gofmt/project

RUN set -ex && \
  CGO_ENABLED=0 go build -v -a -ldflags '-s -w -extldflags "-static"' -o exe && \
  mv ./exe /usr/bin/exe

FROM busybox
COPY --from=builder /usr/bin/exe /usr/local/bin/exe

ENTRYPOINT [ "exe" ]