# Bourrinage : installation joueur (Prism Launcher)

1. Installer **Prism Launcher** (prismlauncher.org), l'ouvrir et ajouter son compte Microsoft
   (bouton en haut à droite > Gérer les comptes > Ajouter Microsoft).
2. **Ajouter une instance** > **Importer** > coller ce lien, puis OK :

   ```
   https://github.com/Cologonm/bourrinage-pack/releases/latest/download/Bourrinage.zip
   ```

3. Sélectionner **Bourrinage** > **Lancer**. Si Prism propose de télécharger Java, accepter.
   Une fenêtre « packwiz » télécharge les mods (quelques minutes la première fois), puis le jeu s'ouvre.

C'est tout. À chaque lancement, le pack se met à jour tout seul. L'adresse du serveur est donnée
par l'organisatrice ou l'organisateur (le serveur est sur liste blanche : donner son pseudo pour être ajouté).

Les mondes, options et waypoints ne sont jamais touchés.

### Installation manuelle (si l'import ne marche pas)

1. Créer une instance : Minecraft 1.20.1, Fabric Loader 0.18.4. Allouer 4 à 5 Go de RAM.
2. Ouvrir le dossier `.minecraft` de l'instance, y déposer `packwiz-installer-bootstrap.jar`
   (github.com/packwiz/packwiz-installer-bootstrap/releases).
3. Instance > Modifier > Paramètres > Commandes personnalisées > Pré-lancement :

   ```
   "$INST_JAVA" -jar packwiz-installer-bootstrap.jar https://raw.githubusercontent.com/Cologonm/bourrinage-pack/main/pack.toml
   ```

4. Lancer le jeu.

## Contenu du pack (45 mods)

Les mods marqués *(client)* ne sont installés que chez les joueurs, pas sur le serveur.

**Pokémon**
1. Cobblemon 1.5.2
2. CobblemonRider

**Tech**
3. Create Fabric
4. Create: New Age
5. Create Crafts & Additions

**Cuisine et déco**
6. Farmer's Delight Refabricated
7. [Let's Do] Brewery (Legacy)
8. [Let's Do] Bakery (Legacy)
9. [Let's Do] Vinery
10. [Let's Do] Farm & Charm
11. [Let's Do] Meadow
12. [Let's Do] Furniture

**Stockage**
13. Storage Drawers
14. Sophisticated Backpacks
15. Sophisticated Core

**Monde et gameplay**
16. Terralith
17. When Dungeons Arise
18. When Dungeons Arise - Seven Seas
19. Bountiful
20. Universal Graves
21. Tree Harvester
22. Waystones

**Interface**
23. JEI *(client)*
24. WTHIT *(client)*
25. AppleSkin *(client)*
26. Xaero's Minimap *(client)*
27. Xaero's World Map *(client)*

**Performance**
28. Sodium *(client)*
29. Indium *(client)*
30. Lithium
31. FerriteCore
32. ModernFix
33. Entity Culling *(client)*
34. ImmediatelyFast *(client)*

**Librairies**
35. Fabric API
36. Architectury
37. Cloth Config
38. Collective
39. Kambrik
40. Fabric Language Kotlin
41. Forge Config API Port
42. Bad Packets
43. Polymer
44. [Let's Do] API
45. Balm

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
