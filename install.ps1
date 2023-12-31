# Install Script

# Development packages
$devPkgs = "openjdk11", "python3", "code"

Write-Host "Setting up local development environment..."

# Install scoop & git
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing scoop..."
    iwr -useb get.scoop.sh | iex
}

# Install git if not present
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
	Write-Host "Installing Git..."
        scoop install git
        $gitInstallPath = (scoop prefix git)
        Invoke-Expression "$gitInstallPath\install-context.reg"
        Invoke-Expression "$gitInstallPath\install-file-associations.reg"
}

scoop bucket add extras

scoop bucket add java

scoop update

foreach ($pkg in $devPkgs) {
    if(($pkg -match "python3") -or !(Get-Command $pkg -ErrorAction SilentlyContinue)) {
        if($pkg -match "python3"){
            $pkg = "python"
        }
	if($pkg -match "code"){
            $pkg = "vscode"
        }
        Write-Host "Installing $pkg..."
        scoop install $pkg
        if ($pkg -match "vscode") {
            Write-Host "Installing VS Code extension: redhat.java..."
            code --install-extension redhat.java
        }
        if($pkg -match "python" ){
            pip install requests
        }
    }
}
