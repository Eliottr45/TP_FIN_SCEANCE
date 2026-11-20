--Le problème de la requêtes est qu'elle ne prends pas en compte les clients avec comme id NULL--

SELECT employes.id, employes.nom
FROM employes
WHERE NOT EXISTS (
  SELECT 1
  FROM employes
  WHERE employes.manager_id = employes.id
);