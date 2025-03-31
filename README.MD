# MinIO Home Assistant Add-on (Ultimate Edition)

## 🚀 Overview
MinIO is a high-performance, S3-compatible object storage server ideal for storing backups, logs, and media — now available as a Home Assistant add-on! This add-on is designed to be flexible, user-friendly, and powerful.

---

## ✅ Key Features
- 🔐 Access/Secret Key or Username/Password support
- 🗃️ Customizable storage path (default: `/data/minio`)
- 🔄 External Web UI on port `9001`
- 💡 Optional public directory for shared S3 buckets
- 🧱 Multi-arch support (aarch64, amd64)
- 📦 Built-in health check and logging
- 🌐 Designed for use with SMB, backups, and cloud workflows

---

## 🔧 Configuration
```yaml
access_key: "admin"
secret_key: "minio123"
port: 9000
console_port: 9001
storage_path: "/data/minio"
public_bucket_path: "/share/minio/public"  # Optional
enable_ssl: false
```

### Configuration Options:
| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `access_key` | string | required | S3 Access Key |
| `secret_key` | string | required | S3 Secret Key |
| `port` | int | `9000` | S3 API Port |
| `console_port` | int | `9001` | MinIO Console Port |
| `storage_path` | string | `/data/minio` | Where objects are stored |
| `public_bucket_path` | string | None | Optional public-access directory |
| `enable_ssl` | bool | false | SSL mode (certs in `/ssl`) |

---

## 🌐 Access
After installing, access the MinIO Console via:
- Web UI: `http://homeassistant.local:9001`
- S3 Endpoint: `http://homeassistant.local:9000`

---

## 🧪 S3 Usage Example
```bash
aws configure --profile minio-ha
# Access Key: your access_key
# Secret Key: your secret_key
# Endpoint: http://homeassistant.local:9000

aws --profile minio-ha s3 ls --endpoint-url http://homeassistant.local:9000
```

---

## 💾 SMB-Friendly Directories
Map your storage to `/share/minio/objects` and expose:
- `/share/minio/public` (optional public folder)

Use SMB to easily access these from your local network.

---

## 🔒 Security
- Don't expose ports 9000/9001 publicly unless secured
- Use strong access/secret keys
- Use `readonly_mode` (coming soon!) for demo/testing

---

## 👀 Future Ideas
- Gateway mode for S3/Backblaze
- SSL auto-cert management
- Auto-bucket creation
- Log streaming or MQTT upload events

---

## 📎 Health Check
Add-on uses:
```yaml
watchdog: "http://[HOST]:[PORT:9001]/minio/health/live"
```

---

## 🧠 Credits
Made with ❤️ by Paul Watson
- Repo: [minio-ha-addon](https://github.com/watsonpaul80/minio-ha-addon)

Pull requests, issues, and ideas welcome!

---

Ready to become the most polished S3 add-on in Home Assistant land? Let’s gooo 🚀

