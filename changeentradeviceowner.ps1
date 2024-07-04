# Ensure the AzureAD module is installed
if (-not (Get-Module -ListAvailable -Name AzureAD)) {
    Install-Module -Name AzureAD -Force
}

# Connect to Azure AD
Connect-AzureAD

# Function to get object ID for a device by its name
function Get-DeviceObjectId {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DeviceName
    )
    $device = Get-AzureADDevice -All $true | Where-Object { $_.DisplayName -eq $DeviceName }
    if ($device) {
        return $device.ObjectId
    } else {
        Write-Error "Device with name '$DeviceName' not found."
        return $null
    }
}

# Function to get object ID for a user by username
function Get-UserObjectId {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Username
    )
    $user = Get-AzureADUser -Filter "userPrincipalName eq '$Username'"
    if ($user) {
        return $user.ObjectId
    } else {
        Write-Error "User with username '$Username' not found."
        return $null
    }
}

# Get device name and username from the user
$deviceName = Read-Host "Enter the device name"
$username = Read-Host "Enter the username"

# Get object IDs
$deviceObjectId = Get-DeviceObjectId -DeviceName $deviceName
$userObjectId = Get-UserObjectId -Username $username

# Add the user as a registered owner of the device
if ($deviceObjectId -and $userObjectId) {
    Add-AzureADDeviceRegisteredOwner -ObjectId $deviceObjectId -RefObjectId $userObjectId
    Write-Host "User '$username' added as a registered owner of device '$deviceName'."
} else {
    Write-Error "Failed to add user as a registered owner of the device."
}
