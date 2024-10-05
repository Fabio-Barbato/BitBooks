FROM gcc:latest

WORKDIR /usr/src/app

COPY . .

RUN gcc -D_XOPEN_SOURCE=500 -o server server.c Controller/cJSON.c -lm

EXPOSE 8080

CMD ["./server"]