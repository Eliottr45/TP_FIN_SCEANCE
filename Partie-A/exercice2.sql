--DROP INDEX idx_montant_commande_livree ON commandes;--

CREATE INDEX idx_montant_commande_livree
ON commandes(statut, montant_total DESC, date_commande);

SELECT client_id, date_commande, montant_total, statut
FROM commandes
WHERE statut = 'LIVREE'
AND date_commande >= '2026-01-01'
AND date_commande < '2027-01-01'
ORDER BY montant_total
LIMIT 10

--COST avant: 3.35--
--COST après: 1.05--