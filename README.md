[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/uVveVTyd)
# Projet Data module 2 : Congo Resource Gold (Analyse de Performance Opérationnelle)

## Contexte

Vous êtes consultant Data pour **"Congo Resource Gold" (CRG)**, une multinationale opérant plusieurs sites d'extraction de cuivre et de cobalt dans le Lualaba et le Haut-Katanga.

Le Groupe dispose d'une base de données SQL centralisée nommée `crg_mining_db`. Jusqu'à présent, cette base était peu exploitée. Votre mission est d'extraire les données stratégiques pour le rapport trimestriel du CODIR (Comité de Direction) et de construire un dashboard automatisé.



## MLD Congo Resource Gold

![MLD Congo Resource Gold](./crg-mining-mld.png "MLD Congo Resource Gold")



## Objectifs pédagogiques

Ce projet vous permet de valider les compétences du Module 2 :

1. **Architecture de données** : Passer d'une liste de fichiers plats à un schéma relationnel (MCD) cohérent.

2. **Maîtrise du SQL** : Interroger une base de données pour extraire des KPIs complexes sans passer par Excel.

3. **Intelligence d'Affaires (BI)** : Automatiser le flux de données entre un serveur SQL et Power BI.

4. **Expertise Métier** : Comprendre et calculer les indicateurs clés du secteur minier (Teneur, Rendement, Royalties).




## Technologies autorisées

| **Domaine**	| **Détails** |
|:-------- |:--------:|
| **Modélisation**	| Diagramme de base de données (MCD/MLD) |
| **Base de Données**	| SQL (PostgreSQL, MySQL ou SQLite via DBeaver) |
| **Business Intelligence**	| Power BI (Connexion SQL, DAX de base, Visualisations interactives) |




## Cahier des charges

### Mission A : Exploration et Audit (SQL)

Avant de créer des graphiques, vous devez valider la qualité des données en SQL :

* **Inventaire** : Compter le nombre d'engins par site.

* **Vérification** : Identifier s'il y a des jours où la production a été nulle (Tonnage = 0).

* **Jointure de contrôle** : Afficher la liste des engins avec le nom de leur site respectif (au lieu de l'ID).

### Mission B : Intelligence Métier et KPIs (SQL Avancé)

Le Directeur des Opérations a besoin de chiffres précis. Rédigez les requêtes pour :

1. **Production Totale** : Somme du tonnage brut par Province et par Type de Minerai.

2 **Calcul du "Contenu Fin"** : Le tonnage de métal pur (Tonnage Brut * Teneur %).

3. **Analyse Financière** : Chiffre d'affaires total par site (Tonnage Vendu * Prix Unitaire).

4. **Alerte Teneur** : Lister les sites dont la teneur moyenne est inférieure à 2.5% (seuil de rentabilité).

### Mission C : Pilotage Décisionnel (Power BI)

Connectez Power BI à la base SQL et créez un rapport comprenant :

* **Le "Mining Map"** : Répartition de la production par province (Lualaba / Haut-Katanga).

* **Le "Production Trend"** : Courbe d'évolution de l'extraction sur les 6 derniers mois.

* **Le Top 3 des Sites** : Classement par chiffre d'affaires généré.

* **Slicer (Filtre)** : Permettre de filtrer tout le dashboard par "Type de Minerai" (Cuivre ou Cobalt).




## Livrables attendus

* **Fichier SQL** : requetes_analyse.sql contenant toutes les requêtes des missions A et B.

* **Fichier Power BI (crg_dashboard_v1.pbix)** : Le dashboard interactif et fonctionnel.

* **Une présentation (Pitch) de 10 minutes simulant une réunion de direction** : "Voici l'état de nos mines au dernier trimestre".

**Note pour la soumission** :

Le lien vers le repos Github sur lequel vous allez déposer votre travail :

Pour la classe 2026-janvier-da-soir-b.
Pour la classe 2026-janvier-da-midi-c.

Vous trouverez également les fichier avec lesquels vous devez travailler sur le repos Github.

Après avoir déposer votre travail sur Github, veuillez copier l'url du repos Github et finaliser votre soumission en le soumettant sur canvas




## Délais & Présentation

* **Date limite de rendu** : d'ici 2 semaine à partir du jour de publication du projet.

* **Présentation orale (15 min)** :

    * **Une présentation (Pitch)** : simulation d'une réunion de direction.

    * **Démonstration** : Explication du fichier `requetes_analyse.sql`.

    * **Justification** : Parcours du Dashboard Power BI.

    * **Partage d'expérience** : Difficultés rencontrées lors de la réalisation du projet.




Conseils de l'équipe Senior Data

 1. Le test du bon sens et de l'échantillon

>"Sur Excel, vous aviez l'habitude de voir toutes vos données sous les yeux. En SQL, c'est différent : une erreur de jointure ou un `GROUP BY` mal formulé peut faire 'disparaître' 10 000 tonnes de minerai ou doubler votre chiffre d'affaires sans jamais afficher de message d'erreur ! L'ordinateur calcule exactement ce que vous lui demandez, même si c'est faux.




 2. Notre règle d'or : Ne croyez jamais votre première requête d'agrégation aveuglément. 

>Avant de lancer un grand `SUM()` sur toute la base de données, isolez toujours un petit échantillon. Faites un `SELECT *` avec un `WHERE` sur une seule journée et un seul site. Calculez mentalement (ou sur un petit brouillon) ce que vous devriez obtenir. Ensuite, lancez votre grosse requête complexe. Si les résultats ne correspondent pas à votre test de bon sens, c'est qu'il y a une faille dans votre code. Validez toujours la logique sur petit avant de l'appliquer en grand !"





