#!/bin/bash

# Display the banner
cat << "EOF"
███╗   ███╗ █████╗ ██╗  ██╗██╗███╗   ███╗ ██████╗ ██████╗ 
████╗ ████║██╔══██╗██║  ██║██║████╗ ████║██╔═══██╗██╔══██╗
██╔████╔██║███████║███████║██║██╔████╔██║██║   ██║██████╔╝
██║╚██╔╝██║██╔══██║██╔══██║██║██║╚██╔╝██║██║   ██║██╔═══╝ 
██║ ╚═╝ ██║██║  ██║██║  ██║██║██║ ╚═╝ ██║╚██████╔╝██║     
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     
                                                          
EOF

echo "🚀 Installing Docker (stable channel)..."
curl -sSL https://get.docker.com/ | CHANNEL=stable bash

echo "🔑 Setting up NodeSource repository for Node.js 16..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

echo "🚀 Updating system packages..."
sudo apt update

echo "📦 Installing Node.js and Git..."
sudo apt install -y nodejs git

echo "🌐 Cloning the skyportd repository..."
git clone https://github.com/achul123/skyportd

if [ $? -ne 0 ]; then
  echo "❌ Failed to clone the repository."
  exit 1
fi

echo "📂 Changing directory to skyportd..."
cd skyportd || { echo "❌ Failed to change directory to skyportd."; exit 1; }

echo "📦 Installing npm dependencies..."
npm install

# Prompt for a custom npm command
read -rp "🔧 Enter any custom npm command to run (or press Enter to skip): " npm_cmd

if [ -n "$npm_cmd" ]; then
  echo "⚙️ Running custom npm command: $npm_cmd"
  "$npm_cmd" || { echo "❌ Custom npm command failed."; exit 1; }
else
  echo "⏩ Skipping custom npm command."
fi

echo "🚀 Starting skyportd..."
node .

echo "📢 Don't forget to subscribe to my YouTube channel for more content! 👉 https://youtube.com/@mahimking11 🎥🎮"
