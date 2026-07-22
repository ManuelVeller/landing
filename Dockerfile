# Use a lightweight Nginx image to serve static files
FROM nginx:alpine

# Copy index.html and the assets folder to Nginx's default public directory
COPY index.html /usr/share/nginx/html/index.html
COPY assets/ /usr/share/nginx/html/assets/

# Expose port 80 to receive web traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
