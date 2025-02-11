FROM golang:1.23.6-alpine

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY main.go ./

RUN go build -o /full-cycle

EXPOSE 8080

CMD ["/full-cycle"]