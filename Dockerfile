# Stage 1: Build the React application
FROM node:18-alpine as build

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json* ./ 
RUN npm ci

# Copy remaining application code
COPY . .

# Add ARG for build-time environment variables
ARG REACT_APP_EXAMPLE
ENV REACT_APP_EXAMPLE=$REACT_APP_EXAMPLE

# Build the application
RUN npm run build

# Stage 2: Serve the React application using Nginx
FROM nginx:alpine

# Copy compiled app from build stage
COPY --from=build /app/build /usr/share/nginx/html

# Copy a custom nginx config that helps with SPA routing (optional)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
