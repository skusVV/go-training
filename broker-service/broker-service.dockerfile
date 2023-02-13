# base go image
# Created to build Go code into executable file
# So why we need to have Go image here
FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api

RUN chmod +x /app/brokerApp

# build a tiny docker image
# Then run only executable file, 
# NOTE we don't need any requirements of GO anymore

FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/brokerApp /app

CMD ["app/brokerApp"]