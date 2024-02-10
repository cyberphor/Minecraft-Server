## Local Development

**Step 1.** Install the Azure CLI.
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

**Step 2.** 
```bash
az account set --subscription "Personal"
```

**Step 2.** Install Azure Functions Core Tools.
```bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt update
sudo apt install azure-functions-core-tools-4 -y
```

**Step 3.** Install your Python dependencies (e.g., `azure-functions`).
```bash
python -m pip install -r requirements.txt
```

**Step 3.** Run your code.
```bash
func start
```

**Step 2.** Define environment variables.
```powershell
$env:AZURE_TENANT_ID=""
$env:AZURE_CLIENT_ID=""
$env:AZURE_CLIENT_SECRET="" 
```