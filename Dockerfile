# Use Node.js as the base image
FROM node:14

# Set the working directory to the client folder
WORKDIR /app/client

# Copy package.json and package-lock.json to the working directory for client
COPY client/package.json client/package-lock.json ./

# Install dependencies for client
RUN npm install

# Copy the entire client.husky directory into the image
COPY client.husky /app/client.husky

# # Set the working directory to the root
# WORKDIR /app

# Copy the rest of the application files
COPY client /app/client

RUN npm run build

# Expose the port your app runs on
EXPOSE 3000

# WORKDIR /app/client

# Command to build and start your application
CMD ["npm", "start"]
