ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache bash curl jq && \
    ARCH=$(uname -m) && \
    case "$ARCH" in \
      aarch64) MINIO_ARCH="arm64" ;; \
      x86_64) MINIO_ARCH="amd64" ;; \
      *) echo "❌ Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    echo "✅ Downloading MinIO for $MINIO_ARCH" && \
    curl -sSLO "https://dl.min.io/server/minio/release/linux-${MINIO_ARCH}/minio" && \
    chmod +x minio && \
    mv minio /usr/local/bin/minio

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
