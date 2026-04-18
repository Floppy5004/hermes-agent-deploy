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

# Clone the repository (Ensuring directory is handled correctly)
git clone https://github.com/Floppy5004/hermes-agent-deploy.git /tmp/hermes-repo
cp -r /tmp/hermes-repo/. .
rm -rf /tmp/hermes-repo

# Create .env file from example
if [ ! -f .env ]; then
    cp .env.example .env
    echo "Created .env file from .env.example. Please edit it with your API keys."
fi

# Start services using modern docker compose
docker compose up -d

echo "Installation complete. Agent is starting in background."
echo "Next step: Edit /opt/hermes-agent/.env and restart with 'docker compose restart'"
