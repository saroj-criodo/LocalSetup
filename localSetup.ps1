# Local Setup

# Development packages
$devPkgs = "openjdk11", "gradle", "python", "vscode"

Write-Host "Setting up local development environment..."

# Install scoop & git
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing scoop..."
    iwr -useb get.scoop.sh | iex
    scoop bucket add extras
    scoop bucket add java

    # Install git if not present
    if (!(Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Git..."
        scoop install git
        $gitInstallPath = (scoop prefix git)
        Invoke-Expression "$gitInstallPath\install-context.reg"
        Invoke-Expression "$gitInstallPath\install-file-associations.reg"
    }

    scoop update
}

function install {
    foreach ($pkg in $devPkgs) {
        if (($pkg -match "python") -or !(Get-Command $pkg -ErrorAction SilentlyContinue)) {
            Write-Host "Installing $pkg..."
            scoop install $pkg
            if ($pkg -match "vscode") {
                Write-Host "Installing VS Code extension: redhat.java..."
                code --install-extension redhat.java
            }
        }
    }
}

function uninstall {
    foreach ($pkg in $devPkgs) {
        if (($pkg -match "openjdk17") -or (Get-Command $pkg -ErrorAction SilentlyContinue)) {
            Write-Host "Uninstalling $pkg..."
            scoop uninstall $pkg
        }
    }
}

$command = $args[0]
switch ($command) {
    { $_ -in "install", "-i" } {
        install
    }
    { $_ -in "uninstall", "-u" } {
        uninstall
    }
    default {
        Write-Host "Usage: setup.ps1 [install | uninstall]"
    }
}
