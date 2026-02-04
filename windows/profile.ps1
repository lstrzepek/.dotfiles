# Load modules
Import-Module Posh-Git

# Aliases
Set-Alias -Name ll -Value Get-ChildItem

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

$PSStyle.Progress.Style = "`e[38;5;123m"
# Define theme colors using PSStyle (works with Windows Terminal themes)
$colors = @{
    Default = $PSStyle.Foreground.White
    Accent = $PSStyle.Foreground.Blue
    Path = $PSStyle.Foreground.Blue
    Success = $PSStyle.Foreground.Green
    Prompt = $PSStyle.Foreground.BrightMagenta
    Environment = $PSStyle.Foreground.Purple
}
 
# Git prompt configuration
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = $colors.Environment
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptAbbreviateGitDirectory = $true
$GitPromptSettings.DefaultPromptPath.ForegroundColor = $colors.Path
$GitPromptSettings.BranchColor.ForegroundColor = $colors.Default
$GitPromptSettings.IndexColor.ForegroundColor = $colors.Default
$GitPromptSettings.WorkingColor.ForegroundColor = $colors.Accent
 
# Git status symbols
$GitPromptSettings.BeforeStatus.Text = [char]0xe0a0
$GitPromptSettings.BeforeStatus.ForegroundColor = $colors.Default
$GitPromptSettings.AfterStatus.Text = ""
$GitPromptSettings.BranchIdenticalStatusSymbol.Text = [char]0xf14a
$GitPromptSettings.FileAddedText = "󱪞"
$GitPromptSettings.FileModifiedText = "󰷉"
$GitPromptSettings.FileRemovedText = "󱪜"
 
# Prompt configuration
$promptChar = [char]0x276f
$GitPromptSettings.DefaultPromptSuffix.Text = " $($promptChar.ToString() * ($nestedPromptLevel + 1)) "
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = $colors.Prompt
 
function prompt {
    $prompt = Write-Prompt "[$(Get-Date -Format HH:mm:ss)] " -ForegroundColor $colors.Default
    
    $prompt += & $GitPromptScriptBlock
    if ($prompt) { "$prompt " } else { " " }
}
