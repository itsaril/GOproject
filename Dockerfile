# Build stage
FROM golang:1.18.4-alpine3.16 AS builder
WORKDIR /app
COPY . .
RUN go build -o main api/main.go

# Run stage
FROM alpine:3.16
WORKDIR /app
COPY --from=builder /app/main .
COPY wait-for.sh .
# RUN chmod u+x wait-for.sh
EXPOSE 8080
CMD ["/app/main"]

