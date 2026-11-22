# Projet : pack packwiz "Bourrinage"

Modpack Minecraft 1.20.1 / Fabric 0.18.4, distribué avec packwiz. Les joueurs utilisent Prism Launcher
et sont mis à jour automatiquement au lancement via packwiz-installer-bootstrap.

## Structure
- `pack.toml`, `index.toml` : métadonnées du pack (ne pas éditer à la main, utiliser `packwiz refresh`)
- `mods/*.pw.toml` : un fichier par mod (métadonnées CurseForge, pas de .jar dans le dépôt)
- Rien de personnel dans le pack : saves, options.txt, servers.dat, xaero, screenshots, resourcepacks, shaderpacks restent chez chaque joueur.

## Commandes courantes (packwiz installé)
- Ajouter un mod : `packwiz curseforge add <slug ou url>` (ou `packwiz modrinth add <slug>`)
- Retirer : `packwiz remove <nom>`
- Mettre à jour : `packwiz update --all`
- Régénérer l'index après modif manuelle : `packwiz refresh`
- Publier : `git add -A && git commit -m "..." && git push` (les joueurs reçoivent la mise à jour au prochain lancement)

## Configs partagées
Pour partager un fichier de config, le placer dans `config/` du pack puis `packwiz refresh`.
Pour qu'il ne soit pas écrasé chez les joueurs, mettre `preserve = true` sur son entrée dans index.toml.

## Outils sur ce Mac
- packwiz : `~/go/bin/packwiz` (compilé avec Go installé dans `~/.local/go`, sans droits admin).
  Ajouter `export PATH="$HOME/go/bin:$HOME/.local/go/bin:$PATH"` à `~/.zshrc`.
- `./check.sh` : refresh + vérif 1.20.1/Fabric + hashs + mises à jour simulées. À lancer avant chaque push.
- `.packwizignore` : fichiers du dépôt à ne pas envoyer aux joueurs (README, CLAUDE.md, check.sh...).

## Pièges connus
- `packwiz curseforge add` ajoute les dépendances en dernière version (ex. Fabric API) : vérifier
  le diff et repinner avec `packwiz curseforge add --addon-id <projet> --file-id <fichier>` si besoin.
- Entity Culling vient de Modrinth (pas de fichier Fabric 1.20.1 tagué sur CurseForge).
- FerriteCore Fabric sur CurseForge = slug `ferritecore-fabric`.
- Mods clients (`side = "client"`) : sodium, indium, xaero x2, wthit, appleskin, jei, entityculling, immediatelyfast.
- Distribution CurseForge vérifiée le 2026-11-22 : aucun mod bloqué.

## À faire
- Dépôt : github.com/Cologonm/bourrinage-pack ; URL raw : https://raw.githubusercontent.com/Cologonm/bourrinage-pack/main/pack.toml
