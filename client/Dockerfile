FROM gcc:latest

WORKDIR /usr/src/app

COPY . .

RUN gcc -o client client.c

EXPOSE 8080

CMD ["./client"]