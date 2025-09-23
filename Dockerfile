# Use a small, secure Nginx image to serve the static site
FROM nginx:1.27-alpine

# Copy the static site into Nginx's default html directory
COPY ./ /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 81

# Simple healthcheck to ensure Nginx is serving content
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- http://localhost/ >/dev/null 2>&1 || exit 1

# Nginx runs as non-root user by default in this image; no CMD override needed

