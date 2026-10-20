# Lädt die Logos in den Ordner icons\ (Windows).
# Aufruf: Rechtsklick auf die Datei > "Mit PowerShell ausführen"
Set-Location $PSScriptRoot
New-Item -ItemType Directory -Force -Path icons | Out-Null

$logos = [ordered]@{
  "opal.png"          = "https://bildungsportal.sachsen.de/opal/raw/20261013/themes/basic_new/images/general/logo-OPAL-login.png"
  "exam.png"          = "https://exam.htw-dresden.de/opal/raw/20261013/themes/opal_new/images/logo-OPAL-Exam-login.png"
  "icloud.png"        = "https://icloud.informatik.htw-dresden.de/nextcloud/index.php/apps/theming/favicon"
  "gdrive.png"        = "https://ssl.gstatic.com/images/branding/product/2x/drive_2020q4_48dp.png"
  # Outlook-Icon von Flatart (icon-icons.com), Lizenz CC BY 4.0 - Namensnennung erforderlich
  "groupware.svg"     = "https://images.icon-icons.com/1826/SVG/4202101logomicrosoftoutlooksocialsocialmedia-115587_115714.svg"
  "academiccloud.ico" = "https://academiccloud.de/favicon.ico"
  "iversion.ico"      = "https://iversion.informatik.htw-dresden.de/favicon.ico"
  "iwiki.svg"         = "https://www.mediawiki.org/static/images/icons/mediawikiwiki.svg"
  "etherpad.ico"      = "https://ipad.informatik.htw-dresden.de/favicon.ico"
}

foreach ($name in $logos.Keys) {
  try {
    Invoke-WebRequest -Uri $logos[$name] -OutFile "icons\$name" -UseBasicParsing -TimeoutSec 20
    Write-Host "ok      $name"
  } catch {
    Write-Host "FEHLT   $name  ($($logos[$name]))"
  }
}
Read-Host "Fertig. Enter zum Schliessen"
