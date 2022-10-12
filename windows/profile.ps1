oh-my-posh --init --shell pwsh --config ~/.ohmyposh.omp.json | Invoke-Expression
Import-Module Posh-Git
$env:POSH_GIT_ENABLED = $true
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
