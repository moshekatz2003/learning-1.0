#!/usr/bin/env bash
set -e
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh
echo "Done. Pull a model: ollama pull llama3.2"
