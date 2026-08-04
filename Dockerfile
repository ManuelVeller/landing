# Use a lightweight Nginx image to serve static files
FROM nginx:alpine

# Copy static files and the assets folder to Nginx's default public directory
COPY index.html /usr/share/nginx/html/index.html
COPY demos.html /usr/share/nginx/html/demos.html
COPY dashboard.html /usr/share/nginx/html/dashboard.html
COPY config.js /usr/share/nginx/html/config.js
COPY assets/ /usr/share/nginx/html/assets/

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 to receive web traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
