# Use an official base image, such as NGINX
FROM nginx:latest

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the "index.html" file into the container's working directory
COPY index.html .

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# The default command to start the NGINX server
CMD ["nginx", "-g", "daemon off;"]
