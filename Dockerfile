FROM golang:1.23.6-alpine AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o main .

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]