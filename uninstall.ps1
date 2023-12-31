# Local Setup

# Development packages
$devPkgs = "openjdk11", "git", "dark", "python", "vscode"

Write-Host "Cleaning Up local Development Environment"

foreach ($pkg in $devPkgs) {
    # Check if the package is installed
    $installedPackages = scoop list $pkg

    if ($installedPackages -ne $null) {
        Write-Host "Uninstalling $pkg..."
	if ($pkg -match "vscode") {
            Write-Host "Uninstalling VS Code extension: redhat.java..."
            code --uninstall-extension redhat.java
        }
        scoop uninstall $pkg
    } else {
        Write-Host "$pkg is not installed."
    }
}
