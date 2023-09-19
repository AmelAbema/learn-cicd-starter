FROM --platform=linux/amd64 debian:stable-slim

RUN apt-get update && apt-get install -y ca-certificates

ADD notely1 /usr/bin/notely1
COPY .env /usr/bin/.env

CMD ["./usr/bin/notely1"]
