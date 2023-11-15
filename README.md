# LocalSetup for Development (Windows)

This PowerShell script is designed to set up a local development environment by installing and managing various development packages using Scoop.

## Packages getting installed:

1. scoop
2. git & git-bash
3. openjdk11
4. python
5. vscode
6. redhat.java #vscode extension for JAVA

## Prerequisites

- PowerShell is required to execute this script.

## Usage

1. Open a PowerShell terminal.

2. Allow running scripts 
	```powershell
	Set-ExecutionPolicy Unrestricted -Scope Process
	``` 

3. Run the script using the following commands:

	To install packages:
	```powershell
	irm https://raw.githubusercontent.com/saroj-criodo/LocalSetup/master/install.ps1 | iex
	```
  
	To uninstall
	```powershell
	irm https://raw.githubusercontent.com/saroj-criodo/LocalSetup/master/uninstall.ps1 | iex
	```

4. Once Done, block execution of scripts via
	```powershell
	Set-ExecutionPolicy Restricted -Scope Process
	```
