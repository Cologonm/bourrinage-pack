#!/usr/bin/env bash
# Construit dist/Bourrinage.zip : instance Prism prête à importer
# (Minecraft 1.20.1, Fabric 0.18.4, 5 Go, bootstrap packwiz + commande de pré-lancement).
# À publier en Release GitHub sous le nom Bourrinage.zip.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p dist
rm -f dist/Bourrinage.zip
( cd prism-instance && zip -qr -X ../dist/Bourrinage.zip instance.cfg mmc-pack.json .minecraft -x '*.DS_Store' )
unzip -l dist/Bourrinage.zip
