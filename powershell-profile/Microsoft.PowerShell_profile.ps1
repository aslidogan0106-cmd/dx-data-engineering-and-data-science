# ============================================================
# PowerShell 7 Profile  Loader (modular)
# Directory: profile.d
# ============================================================

$profileDir = Split-Path $PROFILE -Parent
$modulesDir = Join-Path $profileDir "profile.d"

if (Test-Path $modulesDir) {
    $modules = Get-ChildItem -Path $modulesDir -Filter "*.ps1" -File | Sort-Object Name

    foreach ($m in $modules) {
        try {
            . $m.FullName
        } catch {
            Write-Host "[PROFILE] Erro ao carregar módulo: $($m.Name)" -ForegroundColor Red
            Write-Host $_.Exception.Message -ForegroundColor DarkRed
        }
    }
}
