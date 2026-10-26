# Generates a new stitch YAML file with basic boilerplate
param(
    [string]$Name = "my-stitch",
    [string]$OutputPath = "."
)
$stitch = @{
    name = $Name
    components = @()
    env = @{}
}
$yaml = $stitch | ConvertTo-Yaml
$filepath = Join-Path $OutputPath "${Name}.yaml"
Set-Content -Path $filepath -Value $yaml -Encoding utf8
Write-Host "Generated stitch file at $filepath"
