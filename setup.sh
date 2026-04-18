#!/bin/bash

# Setup script for Hermes AI Agent on Hetzner Cloud
echo "Starting Hermes Agent setup..."

# Update and upgrade system
apt-get update && apt-get upgrade -y

# Install dependencies
apt-get install -y docker.io docker-compose git

# Create application directory
mkdir -p /opt/hermes-agent
cd /opt/hermes-agent

# Clone the repository (Replace with your actual Repo URL)
# Assuming the repo is public or using a token in the URL
git clone https://github.com/Floppy5004/hermes-agent-deploy.git .

# Create .env file from example
if [ ! -f .env ]; then
    cp .env.example .env
    echo "Created .env file from .env.example. Please edit it with your API keys."
fi

# Start services
docker-compose up -d

echo "Installation complete. Agent is starting in background."
echo "Next step: Edit /opt/hermes-agent/.env and restart with 'docker-compose restart'"
