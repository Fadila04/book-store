-- 1. Affichez la somme totale des stocks de livres.
SELECT SUM(stock) AS total_stock
FROM book;

-- 2. Affichez pour chaque auteur le nombre de livres écrits.
SELECT a.first_name, a.last_name, COUNT(b.book_id) AS Nombre_livre
FROM author a
JOIN book b ON a.author_id = b.author_id
GROUP BY a.author_id,a.first_name, a.last_name;


-- 3. Affichez le titre du livre, nom complet de l’auteur, et nom du thème.
SELECT b.title AS Titre_livre, a.first_name, a.last_name, t.theme_name
FROM book b
JOIN  author a ON b.author_id = a.author_id
JOIN  theme t ON b.theme_id = t.theme_id;

-- 4. Affichez toutes les commandes d’un client donné avec titre du livre et date de commande.
SELECT co.order_date, b.title
FROM customer_order co
JOIN book b ON co.book_id = b.book_id
WHERE customer_id = 1;

-- 5. Affichez la moyenne des notes pour chaque livre ayant au moins 3 avis.
SELECT b.title, AVG(r.rating) AS moyenne_note, COUNT(review_id) AS nb_avis
FROM review r
JOIN book b ON r.book_id = b.book_id
GROUP BY b.book_id, b.title
HAVING COUNT(r.review_id) >= 3;

-- 6. Affichez le nombre total de commandes passées par chaque client (email+nb commandes.
SELECT c.email, co.total_amount 
FROM customer_order co
JOIN customer c ON co.customer_id = c.customer_id;

-- 7. Affichez les titres des livres qui n’ont jamais été commandés.
SELECT b.title
FROM book b
JOIN customer_order co ON b.book_id = co.book_id
WHERE co.order_id = 0

-- 8. Affichez le chiffre d’affaires total généré par chaque auteur (somme des prix des livres commandés).
SELECT a.first_name, a.last_name, SUM(b.price) AS Chiffre_affaire
FROM customer_order co 
JOIN book b ON co.book_id = b.book_id
JOIN author a ON b.author_id = a.author_id
GROUP BY a.author_id,a.first_name, a.last_name;