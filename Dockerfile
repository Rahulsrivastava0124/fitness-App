# Use official Nginx image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy your website files to Nginx's HTML directory
COPY .  .

# Ensure the default Nginx configuration is removed to avoid conflicts
RUN rm /etc/nginx/conf.d/default.conf


# Copy custom Nginx configuration (optional)
COPY /default.conf /etc/nginx/conf.d/default.conf

# Expose port 82
EXPOSE 81

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]