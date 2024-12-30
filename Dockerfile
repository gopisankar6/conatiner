# Frontend Dockerfile for React
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./ 
# Include package-lock if available
COPY package-lock.json ./  
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app for production
RUN npm run build

# Serve the frontend using a simple HTTP server
RUN npm install -g serve

# Expose the port
EXPOSE 3000

# Start the app
CMD ["serve", "-s", "build", "-l", "3000"]
