Import-Module BurntToast

# -----------------------------
# Konfigurasi
# -----------------------------
$HIGH_THRESHOLD = 85
$LOW_THRESHOLD  = 30
$CRITICAL_THRESHOLD = 15

$STATE_FILE = "$env:TEMP\battery_state.txt"

# -----------------------------
# Fungsi membaca baterai
# -----------------------------
function Get-BatteryStatus {
    $battery = Get-CimInstance -ClassName Win32_Battery
    if (-not $battery) { return $null }

    $percent = $battery.EstimatedChargeRemaining
    $status  = switch ($battery.BatteryStatus) {
        1 {"Discharging"}
        2 {"AC"}
        3 {"Fully Charged"}
        4 {"Low"}
        5 {"Critical"}
        6 {"Charging"}
        7 {"Charging and High"}
        8 {"Charging and Low"}
        9 {"Undefined"}
        10 {"Partially Charged"}
        default {"Unknown"}
    }
    return @{Percent = $percent; Status = $status}
}

# -----------------------------
# Fungsi kirim notifikasi
# -----------------------------
function Send-BatteryToast($title, $message) {
    New-BurntToastNotification -Text $title, $message
}

# -----------------------------
# Ambil state terakhir dari file
# -----------------------------
if (Test-Path $STATE_FILE) {
    $lastStateData = Get-Content $STATE_FILE | ConvertFrom-Json
} else {
    $lastStateData = @{State="NORMAL"; LastNotifyTime=(Get-Date).AddMinutes(-10)}
}

# -----------------------------
# Baca baterai
# -----------------------------
$bat = Get-BatteryStatus
if (-not $bat) { exit }

$percent = $bat.Percent
$status  = $bat.Status
$currentState = "NORMAL"

# Tentukan state
if ($percent -ge $HIGH_THRESHOLD -and $status -match "Charging|AC") {
    $currentState = "HIGH"
} elseif ($percent -le $LOW_THRESHOLD -and $status -match "Discharging") {
    $currentState = "LOW"
}

# Cek kritis
if ($percent -le $CRITICAL_THRESHOLD -and $status -match "Discharging") {
    $currentState = "CRITICAL"
}

# -----------------------------
# Kirim toast sesuai interval
# -----------------------------
$timeSinceLastNotify = (New-TimeSpan -Start $lastStateData.LastNotifyTime -End (Get-Date)).TotalMinutes
$sendToast = $false

switch ($currentState) {
    "LOW" {
        if ($timeSinceLastNotify -ge 3) { $sendToast = $true }
    }
    "HIGH" {
        if ($timeSinceLastNotify -ge 5) { $sendToast = $true }
    }
    "CRITICAL" {
        $sendToast = $true
    }
}

if ($sendToast) {
    $msg = switch ($currentState) {
        "HIGH" { "🔋 Cabut charger, baterai $percent%" }
        "LOW"  { "⚡Colok charger, baterai $percent%" }
        "CRITICAL" { "🚨 Baterai kritis $percent%, segera colok charger!" }
        default { "Status baterai: $percent%, $status" }
    }
    Send-BatteryToast "Battery Monitor" $msg
    $lastStateData.LastNotifyTime = Get-Date
}

# -----------------------------
# Simpan state terakhir
# -----------------------------
$lastStateData.State = $currentState
$lastStateData | ConvertTo-Json | Set-Content $STATE_FILE
