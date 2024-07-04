
# Running PowerShell Script in Azure Cloud Shell

This guide outlines the steps to execute a PowerShell script that adds a user as a registered owner of a device in Azure AD using Azure Cloud Shell.

## Prerequisites

1. **Azure Account:** You must have an active Azure subscription.
2. **Azure Cloud Shell:** Access to Azure Cloud Shell from the Azure portal.

## Setup

Before running the script, ensure that the required modules are installed and Azure AD is connected in your Azure Cloud Shell session.

### Install Required Modules

If the modules are not already installed, you can install them using the following commands:

```bash
# Install AzureAD module
Install-Module -Name AzureAD -Force
```

### Connect to Azure AD

Before executing the script, connect to Azure AD using the following command:

```powershell
# Connect to Azure AD
Connect-AzureAD
```

Follow the prompts to authenticate to your Azure AD tenant.

## Steps to Execute

1. **Open Azure Cloud Shell:**
   - Navigate to [Azure Portal](https://portal.azure.com).
   - Click on the Cloud Shell icon at the top right of the portal.

2. **Clone or Upload the Script:**
   - Clone this repository or upload your PowerShell script (`changeentradeviceowner.ps1`) to Azure Cloud Shell.

3. **Navigate to the Script Directory:**
   - Use the `cd` command to navigate to the directory where your script is located.

4. **Run the Script:**
   - Execute the script by entering the following command in Azure Cloud Shell:

   ```powershell
   pwsh -NoProfile -Command ./changeentradeviceowner.ps1
   ```

   Replace `changeentradeviceowner.ps1` with the name of your PowerShell script.

5. **Follow On-Screen Prompts:**
   - The script will prompt you to enter the device name and username interactively.

6. **Review Output:**
   - Follow the script's output in Azure Cloud Shell to confirm the success or any errors encountered.
