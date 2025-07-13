🎶 Music Store SQL Analysis
This project explores a music store database using SQL queries to answer business questions related to customer behavior, sales performance, and music trends.
📌 Project Objective
Analyze customer purchasing patterns, genre popularity, top artists, and track statistics using SQL to drive data-backed music store decisions.

🗃️ Dataset
Sample music store database (commonly used in SQL training)

Tables used: customer, invoice, invoice_line, track, album2, genre, artist

🛠️ Tools Used
MySQL / SQL (Structured Query Language)

SQL Workbench / DB tool of your choice

📊 Key SQL Queries Answered
Top 3 countries by total invoices

City with highest revenue (best customers)

Best customer by total spending

List of Rock music listeners

Top 10 Rock artists (by track count)

Tracks longer than average song length

🧠 Sample Query Example
SELECT billing_city, SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_city
ORDER BY total_revenue DESC
LIMIT 1;

✅ This returns the city with the highest total invoice amount — great for targeting promotions.

📈 Insights
Best customers are located in cities with the highest revenue.

Rock music is one of the most popular genres, with several top artists.

Some customers have purchased significantly more than others — ideal for loyalty programs.

Many tracks exceed the average song length — useful for playlist and streaming decisions.

✅ How to Run
Clone this repository

Load the SQL database into MySQL

Run queries from music_store_queries.sql (or notebook, if you created one)
