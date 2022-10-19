FROM golang:alpine as builder

WORKDIR /app

COPY . ./

RUN go build -v -o server

FROM scratch
COPY --from=builder /app/server /app/server
ENTRYPOINT ["/app/server"]