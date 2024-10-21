FROM node:22

WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies without running scripts
RUN npm install --ignore-scripts

# Copy .env file
COPY .env .env

# Copy source files
COPY . .

# List contents of the current directory
# RUN ls -la

# Display TypeScript version
# RUN npx tsc --version

# Display contents of tsconfig.json
# RUN cat tsconfig.json

# Attempt to run TypeScript compilation
RUN npx tsc

# List contents of dist folder (if it exists)
# RUN ls -la dist || echo "dist folder does not exist"

# Expose the port the app runs on
EXPOSE 8080

# Start the application
CMD [ "npm", "start" ]