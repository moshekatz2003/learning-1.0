# Install Ollama on Windows
Write-Host "Installing Ollama..." -ForegroundColor Cyan
irm https://ollama.com/install.ps1 | iex
if (Get-Command ollama -ErrorAction SilentlyContinue) {
    Write-Host "Ollama installed successfully." -ForegroundColor Green
    Write-Host "Pull a model: ollama pull llama3.2"
} else {
    Write-Host "Installation may have failed. Check the output above." -ForegroundColor Red
    exit 1
}
