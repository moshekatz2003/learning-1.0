# learning-1.0

Run [hermes-agent](https://github.com/NousResearch/hermes-agent) locally using [Ollama](https://ollama.com) as the LLM backend — no cloud API keys required.

## How it works

Ollama serves a local LLM on an OpenAI-compatible endpoint (`http://localhost:11434/v1`). hermes-agent is configured to point at that endpoint instead of a cloud provider.

## Quick start

### Option A — automated setup (Linux / macOS / WSL2)

```bash
bash scripts/setup-hermes.sh
```

This installs Ollama, pulls `llama3.2`, installs hermes-agent, and writes the Ollama config.

### Option B — manual steps

**1. Install Ollama**

| Platform | Command |
|----------|---------|
| Windows (PowerShell) | `.\scripts\install-ollama.ps1` |
| Linux / macOS | `bash scripts/install-ollama.sh` |

**2. Pull a model**

```bash
ollama pull llama3.2
```

**3. Install hermes-agent**

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

**4. Apply the Ollama config**

Copy `cli-config.yaml` to `~/.hermes/cli-config.yaml`:

```bash
cp cli-config.yaml ~/.hermes/cli-config.yaml
```

**5. Run**

```bash
hermes
```

## Configuration

`cli-config.yaml` and `.env.example` show the minimal settings needed to point hermes-agent at Ollama.

| Key | Value |
|-----|-------|
| `model` | `ollama/<model-name>` |
| `api_base` | `http://localhost:11434/v1` |
| `api_key` | `ollama` (placeholder — Ollama ignores this) |

To use a different model, run `ollama pull <model>` and update `model` in `cli-config.yaml`.
