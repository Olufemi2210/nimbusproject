# Use the official Node.js image as a base
FROM node:22-alpine3.22
RUN npm install -g npm@11
RUN apk update && apk upgrade --no-cache

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install 

# Copy the rest of the application code
COPY . .
RUN npm run build 
RUN npm install -g serve

# Expose the port your app runs on (change if different)
EXPOSE 3000

# Run the app
CMD ["serve", "-s", "build", "-l", "3000"]