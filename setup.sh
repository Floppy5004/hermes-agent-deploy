#!/bin/bash
set -e

# Setup script for Hermes AI Agent on Hetzner Cloud
echo "Starting Hermes Agent setup..."

# Update and upgrade system
apt-get update && apt-get upgrade -y

# Install dependencies (Modern Docker Compose Plugin)
apt-get install -y docker.io docker-compose-plugin git

# Create application directory
mkdir -p /opt/hermes-agent
cd /opt/hermes-agent

# Clone the deployment repository
git clone https://github.com/Floppy5004/hermes-agent-deploy.git /tmp/deploy-repo
cp -r /tmp/deploy-repo/. .
rm -rf /tmp/deploy-repo

# Clone the Original Hermes Agent Repository for the core build
echo "Cloning original Hermes Agent core..."
git clone https://github.com/nousresearch/hermes-agent.git /opt/hermes-agent/hermes-agent

# Create .env file from example
if [ ! -f .env ]; then
    cp .env.example .env
    echo "Created .env file from .env.example. Please edit it with your API keys."
fi

# Build and Start services
echo "Building and starting services..."
docker compose up -d --build

echo "Installation complete. Agent is starting in background."
echo "Next step: Edit /opt/hermes-agent/.env and restart with 'docker compose restart'"
