# My Rafaelmydocker Docker App

Simple Nginx container with custom configuration, JSON settings, and startup script.

---

### 🚀 How to run locally
```bash
# Build the Docker image
docker build -t my-rafaelmydocker-app .

# Run the container (port 8080 on your PC → port 80 inside container)
docker run -p 8080:80 my-rafaelmydocker-app
