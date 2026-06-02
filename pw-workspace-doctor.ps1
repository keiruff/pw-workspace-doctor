param(
    [string]$Path,
    [int]$OlderThanDays = 30,
    [switch]$Clean,
    [switch]$DryRun
)

Write-Host "ProjectWise Workspace Doctor" -ForegroundColor Cyan
Write-Host "Scan mode only unless -Clean is used." -ForegroundColor Yellow

if (-not $Path) {
    $Path = Read-Host "Enter ProjectWise working directory path"
}

if (-not (Test-Path $Path)) {
    Write-Host "Path not found: $Path" -ForegroundColor Red
    exit
}

$ReportFolder = ".\reports"
if (-not (Test-Path $ReportFolder)) {
    New-Item -ItemType Directory -Path $ReportFolder | Out-Null
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$reportPath = "$ReportFolder\pw-workspace-report-$timestamp.csv"

$cutoff = (Get-Date).AddDays(-$OlderThanDays)

$files = Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue

$report = $files | Select-Object `
    FullName,
    Extension,
    Length,
    @{Name="SizeMB";Expression={[math]::Round($_.Length / 1MB, 2)}},
    LastWriteTime,
    @{Name="OlderThanLimit";Expression={$_.LastWriteTime -lt $cutoff}},
    @{Name="LikelyCADFile";Expression={$_.Extension -match "\.dgn|\.dwg|\.rvt|\.cel|\.dws|\.dgnlib|\.cfg|\.pcf|\.ucf"}}

$totalSizeGB = [math]::Round(($files | Measure-Object Length -Sum).Sum / 1GB, 2)
$totalFiles = $files.Count
$oldFiles = $files | Where-Object { $_.LastWriteTime -lt $cutoff }

$report | Export-Csv -Path $reportPath -NoTypeInformation

Write-Host ""
Write-Host "Scan complete." -ForegroundColor Green
Write-Host "Path: $Path"
Write-Host "Total files: $totalFiles"
Write-Host "Total size: $totalSizeGB GB"
Write-Host "Files older than $OlderThanDays days: $($oldFiles.Count)"
Write-Host "Report saved to: $reportPath"

if ($Clean) {
    Write-Host ""
    Write-Host "Cleanup requested." -ForegroundColor Yellow
    Write-Host "This will only target files older than $OlderThanDays days."

    if ($DryRun) {
        Write-Host "Dry run only. No files deleted." -ForegroundColor Cyan
        $oldFiles | Select-Object FullName, Length, LastWriteTime
        exit
    }

    $confirm = Read-Host "Type DELETE to remove old local files"
    if ($confirm -eq "DELETE") {
        $oldFiles | Remove-Item -Force -ErrorAction SilentlyContinue
        Write-Host "Cleanup complete." -ForegroundColor Green
    } else {
        Write-Host "Cleanup cancelled."
    }
}