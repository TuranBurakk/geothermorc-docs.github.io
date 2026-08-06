# Publish geothermorc-docs (public) — app repo unchanged.
# Prerequisite: gh auth login

$ErrorActionPreference = "Stop"
$Owner = "TuranBurakk"
$Repo = "geothermorc-docs"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

$gh = @(
  "$env:ProgramFiles\GitHub CLI\gh.exe",
  "$env:LOCALAPPDATA\Programs\GitHub CLI\gh.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $gh) { throw "GitHub CLI not found. Install: winget install GitHub.cli" }

& $gh auth status

if (-not (Test-Path (Join-Path $Root ".git"))) {
  git -C $Root init -b master
  git -C $Root add docs .github README.md
  git -C $Root commit -m "docs: privacy policy for GitHub Pages"
}

Write-Host "Creating public repo $Owner/$Repo ..."
& $gh repo create "$Owner/$Repo" --public --source $Root --remote origin --push --description "GeoTherm ORC Studio — privacy policy (GitHub Pages)"

Write-Host "Enabling GitHub Pages (GitHub Actions)..."
& $gh api -X POST "/repos/$Owner/$Repo/pages" -f build_type=workflow 2>$null

& $gh workflow run pages.yml --repo "$Owner/$Repo" 2>$null

$url = "https://turanburakk.github.io/$Repo/privacy-policy.html"
Write-Host "Policy URL: $url"
Write-Host "If 404: repo Settings > Pages > Source: GitHub Actions; wait for workflow."
