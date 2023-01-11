FROM golang:1.19.3-alpine AS builder
WORKDIR /app
ENV CGO_ENABLED=0
COPY ./internal ./internal
COPY ./go.mod ./
COPY ./go.sum ./
COPY ./main.go ./
RUN go build -o /app/app.bin -buildvcs=false -ldflags="-extldflags=-static"

FROM alpine:3
CMD [ "/app.bin" ]
RUN apk add --no-cache ffmpeg
COPY --from=builder /app/app.bin /app.bin
