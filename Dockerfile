FROM mongo:3.6-stretch

ARG INTERNAL_DNS_NAME

ENV INTERNAL_DNS_NAME=$INTERNAL_DNS_NAME

CMD mongod --port 27017 --replSet "rs0" --bind_ip $INTERNAL_DNS_NAME,127.0.0.1