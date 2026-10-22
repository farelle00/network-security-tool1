# TP 1 — Premiers pas avec Git et GitHub

## Question 1 — Différence entre git add et git commit
`git add` place les modifications sélectionnées dans la zone de préparation (index). `git commit` enregistre un instantané des changements préparés dans l'historique local du dépôt, avec un message.

## Question 2 — Que représente un commit ?
Un commit est une version enregistrée du projet. Il possède un identifiant unique (SHA), un auteur, une date, un message et référence les modifications sauvegardées.

## Question 3 — Pourquoi créer une branche ?
Une branche permet de développer et tester une fonctionnalité indépendamment de `main`, sans perturber la version principale. Les modifications peuvent ensuite être relues et fusionnées.

## Question 4 — Rôle d'une Pull Request
Une Pull Request propose l'intégration des modifications d'une branche dans une autre. Elle facilite la revue du code, les échanges, les vérifications et la validation avant fusion.

## Preuves de réalisation
- Dépôt : https://github.com/farelle00/network-security-tool1
- Branche TP 1 : https://github.com/farelle00/network-security-tool1/tree/feature/custom-port
- Pull Request TP 1 fusionnée : https://github.com/farelle00/network-security-tool1/pull/1
- Historique des commits : https://github.com/farelle00/network-security-tool1/commits/main/
- Version du script TP 1 : https://github.com/farelle00/network-security-tool1/blob/feature/custom-port/network_check.py

**Note :** ce dépôt contient aussi les évolutions du TP 2 sur `main`. Le code original du TP 1 reste consultable dans `feature/custom-port` et dans l'historique.
