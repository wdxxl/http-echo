FROM golang:1.19-alpine as build
WORKDIR /go/src
COPY . .

RUN CGO_ENABLED=0 go build \
    -mod=vendor \
    -o /latest \
    main.go

FROM alpine
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

COPY --from=build /latest /latest

EXPOSE 8080

ENTRYPOINT ["/latest"]