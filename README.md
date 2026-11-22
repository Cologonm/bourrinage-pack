# Bourrinage : installation joueur (Prism Launcher)

1. Installer Prism Launcher (prismlauncher.org) et se connecter avec son compte Minecraft.
2. Créer une instance : Minecraft 1.20.1, Fabric Loader 0.18.4. Allouer 4 à 5 Go de RAM.
3. Ouvrir le dossier `.minecraft` de l'instance, y déposer `packwiz-installer-bootstrap.jar`
   (github.com/packwiz/packwiz-installer-bootstrap/releases).
4. Instance > Paramètres > Commandes personnalisées > Pré-lancement :

   ```
   "$INST_JAVA" -jar packwiz-installer-bootstrap.jar https://raw.githubusercontent.com/Cologonm/bourrinage-pack/main/pack.toml
   ```

5. Lancer le jeu : les mods se téléchargent. À chaque lancement, le pack se met à jour tout seul.

Les mondes, options et waypoints ne sont jamais touchés.

## Dépannage

### Un mod est refusé au téléchargement
Message du type « This mod is excluded from the CurseForge API » ou « manual download required ».
Certains auteurs interdisent la distribution de leur mod hors de l'appli CurseForge.

- Côté joueur : la fenêtre de packwiz-installer donne le lien de la page du mod. Télécharger le
  fichier exact indiqué (même nom de fichier) et le déposer dans `.minecraft/mods/` de l'instance,
  puis relancer. Il ne sera plus redemandé tant que le pack ne change pas de version de ce mod.
- Côté mainteneur : remplacer le mod par sa version Modrinth s'il y en a une
  (`packwiz remove <mod>` puis `packwiz modrinth add <slug>`), sinon le signaler ici.

Mods concernés actuellement : aucun connu.

### Conflit de version / le jeu crashe au lancement
- Vérifier que l'instance est bien en **Minecraft 1.20.1** et **Fabric Loader 0.18.4**
  (Instance > Modifier > Version). Une autre version de Fabric peut suffire à faire planter.
- Ne pas ajouter ni mettre à jour de mods à la main dans `mods/` : packwiz ne gère que ses propres
  fichiers, un jar ajouté en plus peut entrer en conflit. Retirer tout jar en trop.
- Si le crash persiste : envoyer au mainteneur le fichier `.minecraft/logs/latest.log`
  (ou le dernier fichier de `.minecraft/crash-reports/`).
- Forcer une réinstallation propre des mods : supprimer le dossier `.minecraft/mods/` et le
  fichier `.minecraft/packwiz.json`, puis relancer. Les mondes ne sont pas concernés.

### Récupérer ses mondes depuis CurseForge
Les mondes de l'ancienne instance CurseForge se trouvent dans
`Documents/curseforge/minecraft/Instances/Bourrinage/` (ou via CurseForge : clic droit sur
l'instance > Ouvrir le dossier).

1. **Fermer les deux launchers**, et faire une copie de sauvegarde de l'ancien dossier `saves/`.
2. Dans Prism : clic droit sur l'instance > Dossier > `.minecraft`.
3. Copier depuis l'ancienne instance vers ce `.minecraft` :
   - `saves/` (les mondes)
   - `options.txt` (réglages, touches), facultatif
   - `servers.dat` (liste des serveurs), facultatif
   - `xaero/` (waypoints et cartes Xaero), facultatif
   - `resourcepacks/`, `shaderpacks/`, `screenshots/` si besoin
4. Lancer une fois pour que les mods s'installent, puis ouvrir le monde.

Ces fichiers appartiennent au joueur : le pack ne les crée, ne les modifie et ne les supprime jamais.
