# Stage 1: Build the React application
FROM node:18-alpine as build

WORKDIR /app

# Set the build argument for REACT_APP_EXAMPLE
ARG REACT_APP_EXAMPLE

# Make sure the environment variable is available during the build process
ENV REACT_APP_EXAMPLE=$REACT_APP_EXAMPLE

# Copy package files and install dependencies
COPY package.json package-lock.json* ./ 
RUN npm ci

# Copy remaining application code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the React application using Nginx
FROM nginx:alpine

# Copy compiled app from build stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
