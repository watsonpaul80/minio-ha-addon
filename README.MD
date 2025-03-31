MinIO Home Assistant Add-on



High performance, self-hosted S3-compatible object storage server for Home Assistant.

This is a fully integrated Home Assistant add-on that runs MinIO — a fast, S3-compatible storage service — with a lightweight footprint and powerful features.

Features ✅

🌐 Web UI Console (with optional SSL)

🔐 Configurable Access Key and Secret Key

🧠 Architecture detection (ARM64/AMD64)

📦 Flexible storage paths and optional public bucket directory

📁 SMB/NAS friendly design (store objects in /share or USB drives)

🚦 Healthcheck & watchdog support

⚡ Works with awscli, S3 backup scripts, and cloud sync tools

Usage Examples

🎯 Backing up Home Assistant to MinIO (with awscli)

aws --endpoint-url http://homeassistant.local:9000 \
    --no-verify-ssl \
    s3 cp /config s3://ha-backups/ --recursive \
    --access-key <your-access-key> \
    --secret-key <your-secret-key>

🧪 Testing S3 Access

aws --endpoint-url http://homeassistant.local:9000 \
    --no-verify-ssl \
    s3 ls \
    --access-key <your-access-key> \
    --secret-key <your-secret-key>

You can also use MinIO Client (mc) for advanced bucket control.

Configuration

access_key: "admin"
secret_key: "minio123"
port: 9000
console_port: 9001
storage_path: "/data/minio"
public_bucket_path: "/share/minio/public"
enable_ssl: false

Option

Description

access_key

MinIO login user (like AWS Access Key)

secret_key

MinIO login password (like AWS Secret Key)

port

Port for S3 API (used by awscli, mc)

console_port

Web UI console port

storage_path

Where objects are stored internally (default: /data/minio)

public_bucket_path

Optional exposed SMB/share path for public files

enable_ssl

Enables HTTPS using certs in /ssl

Web Interface 🌐

Access MinIO Web UI at:

http://homeassistant.local:9001

Or use your external IP like:

http://192.168.3.19:9001

Login with your configured access key and secret.

Backing up Home Assistant with MinIO + awscli

You can use a simple automation or bash script to upload your /config directory daily:

aws s3 sync /config s3://ha-backups/ \
    --endpoint-url http://homeassistant.local:9000 \
    --access-key admin --secret-key minio123

Development & Contributions

Want to contribute? Fork the repo and feel free to raise an issue or PR:

GitHub Repo: https://github.com/watsonpaul80/minio-ha-addon

Credits

MinIO — S3-compatible object storage engine

Home Assistant Add-on Base Images by Home Assistant

License

GNU AGPLv3. See LICENSE for more information.

🚀 Release Notes

v1.1.0

Initial public release

Architecture auto-detect

Flexible storage options

Web UI and S3 API support

Optional public bucket path

Enjoy blazing-fast, self-hosted S3 storage directly inside Home Assistant!

