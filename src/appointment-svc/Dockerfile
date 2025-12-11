# Use official Node.js LTS version as base image
FROM node:18-alpine

# Create and set working directory inside container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first for efficient caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy all app source code
COPY . .

# Expose the port your app runs on
EXPOSE 3001

# Start the application
CMD ["node", "appointment-svc.js"]
