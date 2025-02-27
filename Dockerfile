FROM golang:1.18-alpine AS build-dev
WORKDIR /go/src/app
COPY . ./
RUN CGO_ENABLED=0 go install -buildvcs=false -trimpath -ldflags '-w -s'
FROM scratch
COPY --from=build-dev /go/bin/k8s-go-app /go/bin/k8s-go-app
CMD ["/go/bin/k8s-go-app"]
