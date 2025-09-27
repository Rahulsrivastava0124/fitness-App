# # Use official Nginx image
# FROM nginx:latest

# # Set the working directory
# WORKDIR /usr/share/nginx/html

# # Copy your website files to Nginx's HTML directory
# COPY .  .

# # Ensure the default Nginx configuration is removed to avoid conflicts
# RUN rm /etc/nginx/conf.d/default.conf


# # Copy custom Nginx configuration (optional)
# COPY /default.conf /etc/nginx/conf.d/default.conf

# # Expose port 82
# EXPOSE 81

# # Start Nginx
# CMD ["nginx", "-g", "daemon off;"]


# Use Node.js official image
FROM node:18

# Install dependencies required by Puppeteer
RUN apt-get update && apt-get install -y 

# Set the working directory
WORKDIR /public_assets

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the app's port
EXPOSE 3000

# Start the server using nodemon
CMD ["npx", "nodemon", "server.js"]