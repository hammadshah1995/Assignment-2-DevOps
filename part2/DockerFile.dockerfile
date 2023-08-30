# Use an official base image, such as NGINX
FROM nginx:latest

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Create a new index.html file with the new message using echo
RUN echo "<html><body><h1>Welcome to My Website!</h1><p>This is the new message I added.</p></body></html>" > index.html

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# The default command to start the NGINX server
CMD ["nginx", "-g", "daemon off;"]
