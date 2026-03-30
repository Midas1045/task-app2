# Use official Node image
FROM node:18

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the code
COPY . .

# Expose backend port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]