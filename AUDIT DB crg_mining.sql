--Audit Base de donnée 
--//1.Nombre d'engins 
SELECT
    s.nom AS site,
    COUNT(e.id_engin) AS nombre_engins
FROM sites s
LEFT JOIN engins e
    ON s.id_site = e.id_site
GROUP BY s.nom
ORDER BY nombre_engins DESC;

--//2.Jours Production null ou zero 
--chaque dix jours il y'a pas de production produite
SELECT
    p.date_prod,
    s.nom AS nom_site,
    s.province,
    p.tonnage_brut

FROM production p
INNER JOIN sites s
    ON p.id_site = s.id_site
WHERE p.tonnage_brut = 0
ORDER BY p.date_prod;


--//3. Liste des engins 
--Certains camion doivent être orienté vers les sites rentable, 
--deplacer les camion bene de 150t vers les sites important
SELECT
    e.id_engin,
    e.type AS type_engin,
    s.nom AS site,
    s.province AS province
FROM engins e
INNER JOIN sites s
    ON e.id_site = s.id_site
ORDER BY
e.type,
    s.province,
    s.nom    ;

--Trouver la liste des engins et trouver leur rôle 
--12 type de machine regrouper en (Camion Benne, Chargeuse, Excavatrice, foreuse, niveleuse cat)
SELECT
    MIN(id_engin) AS id_engin,
    COUNT(id_engin) AS Nombre_Engins,
	type
FROM engins
GROUP BY type
ORDER BY type;
--// Production TOtal
--Production dominante cuivre et produitu Haut Katanga
SELECT
    s.province,
    p.type_minerai,
    SUM(p.tonnage_brut) AS production_totale
FROM production p
JOIN sites s
    ON p.id_site = s.id_site
GROUP BY
    s.province,
    p.type_minerai
ORDER BY
    s.province,
    production_totale DESC;

---AUDIT CALCUL
--//Contenu FIn =Tonag*(teneur/100)

SELECT
    id_prod,
    date_prod,
    type_minerai,
    tonnage_brut,
    teneur,
    tonnage_brut * (teneur / 100.0) AS contenu_fin
FROM production
ORDER BY type_minerai;
---ORDER BY SITES
---Reponse PRiorité Kamoto
SELECT
    s.nom,
    SUM(p.tonnage_brut * (p.teneur/100.0)) AS contenu_fin_total
FROM production p
JOIN sites s
    ON p.id_site = s.id_site
GROUP BY s.nom
ORDER BY contenu_fin_total DESC;

--CA by sites 
SELECT
    s.nom,
    SUM(e.tonnage_vendu * e.prix_unitaire_usd) AS chiffre_affaires_usd
FROM exportations e
JOIN sites s
    ON e.id_site = s.id_site
GROUP BY s.nom
ORDER BY chiffre_affaires_usd DESC;

--UPDATE FORMATAGE CHIFFRE 
--Lualaba CHiifre d'AFFAIRE IMPORTANT 
SELECT
    s.nom AS nom_site,
    s.province,
    TO_CHAR(
        SUM(e.tonnage_vendu * e.prix_unitaire_usd),
        'FM999,999,999,999.00'
    ) AS chiffre_affaires_usd
FROM exportations e
JOIN sites s
    ON e.id_site = s.id_site
GROUP BY
    s.nom,
    s.province
ORDER BY
    SUM(e.tonnage_vendu * e.prix_unitaire_usd) DESC;

--Teneur inferieur a 2.5

SELECT
    s.nom,
    AVG(p.teneur) AS teneur_moyenne
FROM production p
JOIN sites s
    ON p.id_site = s.id_site
GROUP BY s.nom
HAVING AVG(p.teneur) < 2.5
ORDER BY teneur_moyenne;

--Teneur superieur a 2.5

SELECT
    s.nom,
    AVG(p.teneur) AS teneur_moyenne
FROM production p
JOIN sites s
    ON p.id_site = s.id_site
GROUP BY s.nom
HAVING AVG(p.teneur) > 2.5
ORDER BY teneur_moyenne;
