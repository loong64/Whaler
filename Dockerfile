FROM ghcr.io/loong64/golang:1.26-alpine3.22 AS builder
ADD ./ /root/whaler_build
WORKDIR /root/whaler_build
RUN export CGO_ENABLED=0 && go build .
RUN cp whaler /root/whaler

FROM ghcr.io/loong64/alpine:3.22.4
WORKDIR /root/
COPY --from=builder /root/whaler .
ENTRYPOINT ["./whaler"]
