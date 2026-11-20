-- Départements
CREATE TABLE departement (
  dept_id  SERIAL PRIMARY KEY,
  dept_nom VARCHAR(100) NOT NULL UNIQUE
);

-- Employés
CREATE TABLE employe (
  employe_id  INT PRIMARY KEY,
  employe_nom VARCHAR(100) NOT NULL,
  dept_id     INT NOT NULL REFERENCES departement(dept_id) --Liaison avec table departement sur dept_id
);

-- Chefs de projet
CREATE TABLE chef_projet (
  chef_id  SERIAL PRIMARY KEY,
  chef_nom VARCHAR(100) NOT NULL,
  chef_tel VARCHAR(20)
);

-- Projets
CREATE TABLE projet (
  projet_id  SERIAL PRIMARY KEY,
  projet_nom VARCHAR(100) NOT NULL UNIQUE,
  chef_id    INT NOT NULL REFERENCES chef_projet(chef_id) -- Liaison avec Chefs de projets sur chef_id
);

-- Affectation des employés 
CREATE TABLE affectation (
  employe_id INT REFERENCES employe(employe_id) ON DELETE CASCADE, -- Liaisonavec la table employe sur employe_id
  projet_id  INT REFERENCES projet(projet_id)   ON DELETE CASCADE, -- Liaison avec la table projet sur projet_id
  PRIMARY KEY (employe_id, projet_id)
);


--En 1FN il y a une seul valeur par case, en 2FN, j'ai séparé les infos de l'employé et celles du projet.
--En 3FN, j'ai mis le téléphone dans une table des chefs 

--Dépendances fonctionnelles sont :
-- employe_id -> employe_nom, dept_nom
-- projet -> chef_projet
-- chef_projet -> chef_projet_tel

--chaque table a sa clé primaire (dept_id, employe_id, chef_id, projet_id).
--La table affectations a une clé primaire composée (employe_id, projet_id).
--Les clés étrangères (REFERENCES) relient les tables entre elles.