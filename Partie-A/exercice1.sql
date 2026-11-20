EXPLAIN ANALYZE SELECT *
FROM commandes
WHERE statut = 'LIVREE'
AND YEAR(date_commande) = 2026
ORDER BY montant_total DESC
LIMIT 10

--Problème n°1: condition de date qui rend la requête non SARGable--
--Problème n°2: un trie manuel est forcé car il n'y a pas d'index qui est déjà trié--