# LocalSetup for Development (Windows)

This PowerShell script is designed to set up a local development environment by installing and managing various development packages using Scoop. The script also ensures that Git is installed and configured. 

## Packages getting installed:

1. scoop
2. git & git-bash
3. openjdk11
4. gradle
5. python
6. vscode
7. redhat.java #vscode extension for JAVA

## Prerequisites

- PowerShell is required to execute this script.

## Usage

1. Open a PowerShell terminal.

2. Navigate to the directory where the script is located. 

3. Run the script using the following commands:

	To install packages:
	```powershell
	irm https://raw.githubusercontent.com/saroj-criodo/PDEs/master/install.ps1 | iex
	```
  
	To uninstall
	```powershell
	irm https://raw.githubusercontent.com/saroj-criodo/PDEs/master/uninstall.ps1 | iex
	```

