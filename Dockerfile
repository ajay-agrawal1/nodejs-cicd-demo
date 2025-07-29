# Use official Node.js LTS image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy app source
COPY . .

# Expose port
EXPOSE 4000

# Start app
CMD [ "node", "app.js" ]

