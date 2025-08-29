FROM node:22

WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies without running scripts
RUN npm install --ignore-scripts

# Copy source files
COPY . .

# Compile TypeScript
RUN npx tsc

# Expose the port the app runs on
EXPOSE 8080

# Start the application
CMD [ "npm", "start" ]