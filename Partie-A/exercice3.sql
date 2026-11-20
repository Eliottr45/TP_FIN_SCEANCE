CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT clients.segment, COUNT(c.id) AS nombre_commande,
    ROUND(SUM(montant_total),2) AS CA_total_seg
FROM commandes AS c
JOIN clients ON c.client_id = clients.id
GROUP BY clients.segment

INSERT INTO commandes (client_id, date_commande, montant_total, statut) VALUES (1, '2026-11-20', 2500.00, 'LIVREE')

