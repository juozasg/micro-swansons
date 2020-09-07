FROM crystallang/crystal:0.35.0


WORKDIR /opt

COPY . /opt

RUN shards build

CMD ["crystal", "natsproducer.cr"]