# Use a lightweight Nginx image to serve static files
FROM nginx:alpine

# Copy static files and the assets folder to Nginx's default public directory
COPY index.html /usr/share/nginx/html/index.html
COPY demos.html /usr/share/nginx/html/demos.html
COPY dashboard.html /usr/share/nginx/html/dashboard.html
COPY demo-rental.html /usr/share/nginx/html/demo-rental.html
COPY config.template.js /usr/share/nginx/html/config.template.js
COPY assets/ /usr/share/nginx/html/assets/

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 to receive web traffic
EXPOSE 80

# Start Nginx in the foreground, dynamically generating config.js from config.template.js using environment variables
CMD ["/bin/sh", "-c", "envsubst < /usr/share/nginx/html/config.template.js > /usr/share/nginx/html/config.js && exec nginx -g 'daemon off;'"]

