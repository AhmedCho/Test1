# List of bloatware apps to remove
$bloatwareApps = @(
    "Microsoft.3DBuilder",
    "Microsoft.Getstarted",
    "Microsoft.Messaging",
    "Microsoft.Office.Sway",
    "Microsoft.OneConnect",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.BingWeather",
    "Microsoft.SkypeApp",
    "Microsoft.MSPaint",
    "Microsoft.ScreenSketch",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.XboxGameOverlay"
)

# Function to remove specified app
function RemoveApp {
    param (
        [string]$appName
    )
    try {
        $app = Get-AppxPackage | Where-Object { $_.Name -eq $appName }
        if ($app) {
            Write-Host "Uninstalling $appName..."
            Remove-AppxPackage -Package $app.PackageFullName -ErrorAction Stop
            Write-Host "$appName has been successfully uninstalled."
        } else {
            Write-Host "$appName is not installed on this system."
        }
    } catch {
        Write-Host "Failed to uninstall $appName. Error: $_"
    }
}

# Main script execution
Write-Host "Starting bloatware removal process..."
foreach ($app in $bloatwareApps) {
    RemoveApp -appName $app
}