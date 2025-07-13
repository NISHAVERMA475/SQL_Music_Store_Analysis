Create Database Music_database;
use music_database;
Select*from album2;

 --- Q1: Who is the senior most employee based on Job Title?
 
Select*from employee
order by levels desc
limit 1;

  --- Q2: Which countries have the most invoices?
  
  Select*from invoice;
	  select count(*) as most_invoice , billing_country
	  from invoice
	  group by billing_country
	  order by most_invoice desc;
      
      --- Q3: What are top three value of total invoices?
      Select*from invoice;
      
      Select total from invoice
      order by total desc 
      limit 3;
      
      --- Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.Write a query that returns one city that has the highest sum of invoice totals. Return both the city name and sum of all invoice totals
     Select*from invoice;
     select billing_city , sum(total) as total_sale
     from invoice 
     group by billing_city; --- Answer of city has the best customers
     
 select billing_city , sum(total) as invoice_total 
     from invoice 
     group by billing_city
     order by invoice_total desc
     limit 1;
     
	--- Q5: Who is best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money?
     Select * from customer; 
      -- use schemas to join two table to get the data customer table and invoice table
      select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
      from customer 
      join invoice on customer.customer_id = invoice.customer_id
      group by customer.customer_id, customer.first_name, customer.last_name
      order by total desc 
      limit 1;
     
  select*from Customer;
  
  
/* Question Set 2 - Moderate */

--- Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners.Return your list ordered alphabetically by email starting with A. 

SELECT DISTINCT customer.email, customer.first_name, customer.last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE invoice_line.track_id IN (
    SELECT track_id FROM track
    JOIN genre ON track.genre_id = genre.genre_id
    WHERE genre.name = 'Rock'
)
ORDER BY customer.email ASC
LIMIT 10;


/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

SHOW TABLES;
SELECT artist.name AS artist_name, COUNT(track.track_id) AS track_count
FROM artist
JOIN album2 ON artist.artist_id = album2.artist_id
JOIN track ON album2.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY track_count DESC
LIMIT 10;

/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
SELECT name, milliseconds
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) FROM track
)
ORDER BY milliseconds DESC;





