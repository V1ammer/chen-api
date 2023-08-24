FROM rust:1.71-alpine3.18 AS builder

WORKDIR chen-api

COPY .. .

RUN apk --update add \
    openssl-dev \
    openssl \
    pkgconfig \
    musl-dev \
    upx \
 && rustup target add x86_64-unknown-linux-musl

RUN RUSTFLAGS='-C target-feature=+crt-static' cargo build --target x86_64-unknown-linux-musl --release \
 && upx --best --lzma target/x86_64-unknown-linux-musl/release/chen-api


FROM scratch AS runtime

COPY --from=builder /chen-api/target/x86_64-unknown-linux-musl/release/chen-api /usr/local/bin/

CMD ["chen-api"]
