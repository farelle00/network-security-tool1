# TP 2 — Réponses aux questions

## Question 1
Les trois tests vérifient la validation de numéros de ports et le rejet d'un port invalide. Ils ne cherchent pas à établir une connexion sur le port 443 : le test `test_valid_port` n'appelle que `is_valid_port(443)`.

## Question 2
`push` se déclenche lorsqu'un commit est envoyé sur une branche configurée (ici `main` ou `feature/**`). `pull_request` se déclenche lors des événements de PR visant `main`, afin de valider les changements avant leur fusion.

## Question 3
Si `pytest` retourne un code différent de zéro, l'étape échoue, le job est marqué en échec et les étapes suivantes ne s'exécutent normalement pas.

## Question 4
Bloquer la fusion d'une Pull Request dont les tests échouent évite d'introduire une régression dans `main`, protège le code partagé et oblige à corriger les erreurs avant intégration.

## Question 5
Le SAST Bandit inspecte statiquement le code source à la recherche de motifs potentiellement vulnérables, sans exécuter le programme. Pytest exécute les tests pour vérifier le comportement fonctionnel attendu. Ces deux contrôles sont complémentaires.

## Bonus
`python -m compileall -q network_check.py` vérifie que le fichier peut être compilé en bytecode Python, notamment qu'il ne contient pas d'erreur de syntaxe. Cette commande ne vérifie ni les résultats fonctionnels des tests pytest ni les failles potentielles relevées par Bandit.

## Livrables complémentaires
- Dépôt : https://github.com/farelle00/network-security-tool1
- Branche : `feature/ci-pipeline`
- Captures d'écran des pipelines vert et rouge : à prendre dans l'onglet Actions de GitHub après les exécutions
- Lien vers la Pull Request : à compléter après sa création
