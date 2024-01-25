## Local Development
**Step 1.** Create a virtual environment.
```bash
python -m venv venv
venv/Scripts/Activate.ps1
python -m pip install -r requirements.txt
```

**Step 2.** Define environment variables.
```powershell
$env:AZURE_TENANT_ID=""
$env:AZURE_CLIENT_ID=""
$env:AZURE_CLIENT_SECRET="" 
```

**Step 3.** Develop and run your code.
```bash
python function_app.py
```
