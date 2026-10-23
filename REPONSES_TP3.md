TP 3 — Audit Docker avec Trivy (adapté à network-security-tool1)

Adaptation du contexte
Le TP d'origine suppose une API, NGINX et éventuellement une base de données. Le projet du TP 2 est un utilitaire Python de vérification de ports locaux. On conteneurise donc cet utilitaire sans inventer de services API, NGINX ou base de données.

 Partie 1 — Infrastructure
Un seul service `network-check` est déclaré dans `compose.yaml`. Aucun port hôte, volume persistant ou secret n'est nécessaire. Le réseau est désactivé avec `network_mode: none` pour la démonstration de validation de port, mais cela empêche tout contrôle réseau réel depuis le conteneur. Pour vérifier des ports locaux réels, exécuter le script directement sur l'hôte, et non dans ce conteneur isolé.

Commandes : `docker compose config`, `docker compose build`, `docker compose run --rm network-check`. Le script étant interactif, `docker compose up -d` n'est pas un test fonctionnel approprié pour ce projet.

Partie 2 — Scan initial
```sh
docker build -t network-security-tool:before .
trivy image --severity HIGH,CRITICAL network-security-tool:before
```
Noter les CVE, versions affectées, gravités et correctifs dans les journaux réels. Aucun résultat Trivy n'est inventé ici.

Partie 3 — Durcissement
Mesures mises en place : image officielle Python slim, utilisateur non-root, suppression de toutes les capacités Linux, interdiction de l'élévation de privilèges, système de fichiers en lecture seule, absence de port publié, et contexte de construction réduit avec `.dockerignore`.

Après modification, exécuter :
```sh
docker compose build
trivy image --severity HIGH,CRITICAL network-security-tool:lab
docker compose run --rm network-check
```
Comparer les scans avant/après réalisés réellement. Attention : l'image `before` construite avec le Dockerfile déjà durci ne constitue pas un état antérieur historique ; pour une comparaison rigoureuse, conserver une image construite avant durcissement.

 Partie 4 — Pipeline
Le workflow `.github/workflows/security-scan.yml` construit l'image et exécute Trivy. Les vulnérabilités HIGH ou CRITICAL détectées entraînent l'échec du job. Le workflow CI du TP 2 reste inchangé.

Questions
Q1. Un scan de code source recherche des problèmes dans le code et les dépendances déclarées ; un scan d'image inspecte les composants et paquets réellement présents dans l'image construite.

Q2. Un port exposé (`EXPOSE`) documente un port attendu dans le conteneur ; un port publié (`ports` / `-p`) rend ce port accessible depuis l'hôte selon la configuration réseau.

Q3. Isoler une base de données sur un réseau backend limite son exposition directe et réserve son accès aux services autorisés. Ce projet ne possède pas de base de données.

Q4. Un conteneur exécuté en root augmente l'impact possible d'une compromission, particulièrement en présence de mauvaises configurations ou de vulnérabilités du runtime.

Q5. HIGH et CRITICAL sont des niveaux de gravité ; CVE identifie publiquement une vulnérabilité connue ; la version corrigée est la version du composant qui inclut un correctif connu.

Q6. `--exit-code 1` fait échouer la commande Trivy lorsqu'une vulnérabilité correspondant aux filtres est détectée, permettant de bloquer une intégration non conforme.

Q7. Une image sans CVE détectée peut encore comporter des failles inconnues, des défauts de configuration ou des risques non couverts par le scanner.

Q8. Après mise à jour, des erreurs de configuration, secrets exposés, failles inconnues et vulnérabilités applicatives peuvent subsister.


