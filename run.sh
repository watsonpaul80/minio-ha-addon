#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

ACCESS_KEY=$(jq -r '.access_key' "$CONFIG_PATH")
SECRET_KEY=$(jq -r '.secret_key' "$CONFIG_PATH")
PORT=$(jq -r '.port' "$CONFIG_PATH")
CONSOLE_PORT=$(jq -r '.console_port' "$CONFIG_PATH")
STORAGE_PATH=$(jq -r '.storage_path // "/data/minio"' "$CONFIG_PATH")
PUBLIC_PATH=$(jq -r '.public_bucket_path // empty' "$CONFIG_PATH")
ENABLE_SSL=$(jq -r '.enable_ssl' "$CONFIG_PATH")

# Create storage path
mkdir -p "$STORAGE_PATH"

# Optional public folder
if [[ -n "$PUBLIC_PATH" ]]; then
    mkdir -p "$PUBLIC_PATH"
    ln -s "$PUBLIC_PATH" "$STORAGE_PATH/public"
fi

export MINIO_ROOT_USER="$ACCESS_KEY"
export MINIO_ROOT_PASSWORD="$SECRET_KEY"

SSL_OPTS=""
if [[ "$ENABLE_SSL" == "true" ]]; then
  SSL_OPTS="--certs-dir /ssl"
fi

echo "[INFO] Starting MinIO"
echo "[INFO] Login with access key: $ACCESS_KEY"

exec minio server "$STORAGE_PATH" \
  --address "0.0.0.0:${PORT}" \
  --console-address "0.0.0.0:${CONSOLE_PORT}" \
  $SSL_OPTS
