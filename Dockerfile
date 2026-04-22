# Use Node 20 as specified in your engines
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Install dependencies first (for better caching)
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Run the build script (webpack)
RUN npm run build

# Expose the port (Tatool usually defaults to 3000)
EXPOSE 3000

# Start the application in lab mode (or 'server' depending on your need)
CMD ["npm", "run", "lab"]
