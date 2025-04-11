FROM postgres:17-alpine

ENV PLUGIN_VERSION=v3.1.0.Final
ENV WAL2JSON_COMMIT_ID=75629c2e1e81a12350cc9d63782fc53252185d8d

RUN apk add --no-cache protobuf-c-dev # buildkit

RUN apk add --no-cache --virtual .debezium-build-deps gcc clang19 llvm19 git make musl-dev pkgconf  \
    && git clone https://github.com/debezium/postgres-decoderbufs -b $PLUGIN_VERSION --single-branch  \
    && (cd postgres-decoderbufs && make && make install) && rm -rf postgres-decoderbufs  \
    && git clone https://github.com/eulerto/wal2json -b master --single-branch  \
    && (cd /wal2json && git checkout $WAL2JSON_COMMIT_ID && make && make install)  \
    && apk del .debezium-build-deps # buildkit