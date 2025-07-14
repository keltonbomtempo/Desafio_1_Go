FROM golang:1.24 AS builder
WORKDIR /app
COPY ./app .
RUN go build -ldflags "-w" hello_full_cycle.go


FROM scratch
WORKDIR /app
COPY --from=builder /app/hello_full_cycle .
CMD [ "./hello_full_cycle" ]
