#!/usr/bin/env bash
# Vérifications du pack Bourrinage avant publication.
# 1. packwiz refresh (index + hashs)
# 2. le pack cible bien Minecraft 1.20.1 / Fabric, aucun mod Forge/NeoForge ou d'une autre version
# 3. mises à jour disponibles, simulées sur une copie (le vrai pack n'est pas modifié)
set -u
cd "$(dirname "$0")"

MC="1.20.1"
LOADER="fabric"
errors=0
warnings=0
err()  { echo "  ERREUR : $*"; errors=$((errors+1)); }
warn() { echo "  ATTENTION : $*"; warnings=$((warnings+1)); }

command -v packwiz >/dev/null 2>&1 || { echo "packwiz introuvable dans le PATH."; exit 2; }

echo "== 1. packwiz refresh"
if ! packwiz refresh; then err "packwiz refresh a échoué"; fi

echo "== 2. Versions"
grep -q "^minecraft = \"$MC\"" pack.toml || err "pack.toml ne cible pas Minecraft $MC"
grep -q "^$LOADER = " pack.toml        || err "pack.toml ne déclare pas le loader $LOADER"
grep -Eq '^(forge|neoforge|quilt) = ' pack.toml && err "pack.toml déclare un autre loader que $LOADER"

for f in mods/*.pw.toml; do
  name=$(sed -n 's/^name = "\(.*\)"/\1/p' "$f")
  file=$(sed -n 's/^filename = "\(.*\)"/\1/p' "$f")
  lower=$(echo "$file" | tr '[:upper:]' '[:lower:]')

  # Jar Forge/NeoForge sans mention de Fabric : presque sûrement mauvais loader
  if echo "$lower" | grep -Eq 'neoforge|forge' && ! echo "$lower" | grep -q 'fabric'; then
    err "$name ($file) ressemble à un jar Forge/NeoForge"
  fi
  # Version de Minecraft dans le nom de fichier différente de 1.20.1 (simple indice : certains
  # mods compatibles 1.20.1 portent 1.20.4 dans leur nom, ex. ImmediatelyFast)
  other=$(echo "$lower" | grep -Eo '1\.(1[6-9]|2[0-9])(\.[0-9]+)?' | grep -v "^$MC$" | grep -Ev '^1\.20$' | head -1)
  if [ -n "$other" ] && ! echo "$lower" | grep -q "$MC"; then
    warn "$name ($file) mentionne $other et pas $MC : à vérifier sur la page du mod"
  fi
  # Sans hash, packwiz-installer ne peut pas vérifier le téléchargement
  grep -q '^hash = ' "$f" || err "$name : pas de hash dans [download] (refaire packwiz curseforge add)"
done

echo "== 3. Mises à jour disponibles (simulation)"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cp -R . "$tmp/pack"
rm -rf "$tmp/pack/.git"
( cd "$tmp/pack" && packwiz update --all -y >/dev/null 2>"$tmp/update.err" ) \
  || warn "packwiz update a renvoyé une erreur : $(tail -1 "$tmp/update.err")"
changed=0
for f in "$tmp"/pack/mods/*.pw.toml; do
  base="mods/$(basename "$f")"
  [ -f "$base" ] || { echo "  + nouveau fichier : $base"; changed=1; continue; }
  old=$(sed -n 's/^filename = "\(.*\)"/\1/p' "$base")
  new=$(sed -n 's/^filename = "\(.*\)"/\1/p' "$f")
  if [ "$old" != "$new" ]; then echo "  ↑ $old  →  $new"; changed=1; fi
done
[ $changed -eq 0 ] && echo "  Tout est à jour."
[ $changed -eq 1 ] && echo "  Pour appliquer : packwiz update --all  (puis tester en jeu avant de pousser)"

echo
echo "Résultat : $errors erreur(s), $warnings avertissement(s)."
[ $errors -eq 0 ]
