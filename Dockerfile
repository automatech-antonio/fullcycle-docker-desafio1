FROM golang AS builder
WORKDIR /usr/app
COPY . /usr/app
RUN go build -x rocks.go

FROM scratch 
WORKDIR /usr/app
COPY --from=builder /usr/app .
CMD [ "./rocks" ]