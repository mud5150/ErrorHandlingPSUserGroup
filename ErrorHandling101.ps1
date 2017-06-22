# Why you might want to use non-terminating errors and the error stream
Get-Something | Update-Something | Set-Something

Get-Something | Update-Something 2>errorlog.txt | Set-Something

# Needs to be redirected
Get-Content .\NoSuchFile.txt >errorlog.txt  # No worky
Get-Content .\NoSuchFile.txt 2>errorlog.txt  # Hooray!

# Don't lose those properties!
$err = Get-Content .\NoSuchFile.txt 2>&1

$err | Get-Member
$err | Format-List –Property * -Force

$err.CategoryInfo
$err.Exception | Get-Member
$err.InvocationInfo

# Your errors live here
$error
$MaximumErrorCount  # THis is the size of your error buffer
$error.Count
$error[0]
$error.Clear()
$error.Count

# Get your own error variables
Get-Item .\,.\BadFile1,.\BadFile2 -ErrorVariable itemReadErrors 2>$null # can also be used like "+itemReadErrors"
$itemReadErrors.Count
$itemReadErrors[0]

# Let's make some decisions
$?  # Can I assk you a question?

# What did you just do?!
$LASTEXITCODE   # Disclaimer: This is only for native or external commands
cmd /c exit 0
$LASTEXITCODE
$?
cmd /c exit 1
$LASTEXITCODE
$?
# Look at examples in robocopy and tentacle script

# Terminating vs non-terminating errors
$ErrorActionPreference   # This lives at the script scope
[System.Enum]::GetNames('System.Management.Automation.ActionPreference') # Don't forget you have a slide for this

# Handling terminating errors (exceptions)
# Show trap example
.\TrapExample.ps1

# Try,catch,finally
.\TryCatchExample.ps1 # Also use this script to show off throw