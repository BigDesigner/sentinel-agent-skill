# Sentinel Skills Installer for Claude Code (Windows PowerShell)

$ClaudeSkillsDir = Join-Path $env:USERPROFILE ".claude\skills"
$RepoDir = $PSScriptRoot

Write-Host "🛡️ Installing Sentinel Skills into Claude Code..." -ForegroundColor Cyan

# Create directory if it doesn't exist
if (-not (Test-Path $ClaudeSkillsDir)) {
    New-Item -ItemType Directory -Path $ClaudeSkillsDir -Force | Out-Null
}

# Link all sentinel skills
Get-ChildItem -Path (Join-Path $RepoDir "skills") -Directory | ForEach-Object {
    $SkillName = $_.Name
    $TargetDir = Join-Path $ClaudeSkillsDir $SkillName
    
    Write-Host "  -> Linking $SkillName..."
    
    # Remove existing link/directory
    if (Test-Path $TargetDir) {
        Remove-Item -Path $TargetDir -Recurse -Force | Out-Null
    }
    
    # Create symlink (requires developer mode or admin, fall back to copy if link fails)
    try {
        New-Item -ItemType SymbolicLink -Path $TargetDir -Value $_.FullName -ErrorAction Stop | Out-Null
    } catch {
        Write-Host "     [Warning] Symbolic link creation failed. Falling back to copy..." -ForegroundColor Yellow
        Copy-Item -Path $_.FullName -Destination $TargetDir -Recurse -Force | Out-Null
    }
}

Write-Host "✅ Sentinel skills successfully linked! Restart Claude Code and verify commands: /sentinel, /sentinel-mb, etc." -ForegroundColor Green
