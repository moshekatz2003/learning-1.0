#!/usr/bin/env bash
set -e

# 1. Install Ollama
echo "==> Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# 2. Pull default model
echo "==> Pulling llama3.2..."
ollama pull llama3.2

# 3. Install hermes-agent
echo "==> Installing hermes-agent..."
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

# 4. Write cli-config.yaml if it doesn't already exist
CONFIG="$HOME/.hermes/cli-config.yaml"
if [ ! -f "$CONFIG" ]; then
    echo "==> Writing Ollama config to $CONFIG..."
    mkdir -p "$(dirname "$CONFIG")"
    cat > "$CONFIG" <<'EOF'
model: ollama/llama3.2
api_base: http://localhost:11434/v1
api_key: ollama
max_turns: 20
terminal_backend: local
EOF
    echo "Config written."
else
    echo "==> $CONFIG already exists, skipping."
fi

echo ""
echo "Setup complete. Run 'hermes' to start the agent."
