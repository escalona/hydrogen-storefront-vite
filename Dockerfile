FROM node:22-slim

WORKDIR /app

# Install necessary build dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies with specific Rollup binary
RUN npm i
# RUN npm install --no-save @rollup/rollup-linux-x64-gnu

# Set environment variables
ENV NODE_ENV=development
# ENV ROLLUP_SKIP_NODEJS=false

# Expose the port that the application will run on
EXPOSE 5173

# Default command for development
CMD ["npm", "run", "dev"] 