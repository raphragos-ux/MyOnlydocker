# My Nginx Docker App

Simple Nginx container with custom config, JSON settings, and entrypoint script.

---

### 🚀 How to run locally
```bash
# Build image
docker build -t my-nginx-app .

# Run container
docker run -p 8080:80 my-nginx-app

