#!/bin/sh
# Lädt die Logos in den Ordner icons/ (Mac/Linux).
# Aufruf im Ordner htw-hub:  sh logos-laden.sh
cd "$(dirname "$0")" && mkdir -p icons

get() {
  if curl -fsSL -m 20 -o "icons/$1" "$2"; then echo "ok      $1"; else echo "FEHLT   $1  ($2)"; rm -f "icons/$1"; fi
}

get opal.png          "https://bildungsportal.sachsen.de/opal/raw/20261013/themes/basic_new/images/general/logo-OPAL-login.png"
get exam.png          "https://exam.htw-dresden.de/opal/raw/20261013/themes/opal_new/images/logo-OPAL-Exam-login.png"
get icloud.png        "https://icloud.informatik.htw-dresden.de/nextcloud/index.php/apps/theming/favicon"
get gdrive.png        "https://ssl.gstatic.com/images/branding/product/2x/drive_2020q4_48dp.png"
get groupware.ico     "https://groupware.htw-dresden.de/favicon.ico"
get academiccloud.ico "https://academiccloud.de/favicon.ico"
get iversion.ico      "https://iversion.informatik.htw-dresden.de/favicon.ico"
get iwiki.svg         "https://www.mediawiki.org/static/images/icons/mediawikiwiki.svg"
get etherpad.ico      "https://ipad.informatik.htw-dresden.de/favicon.ico"
