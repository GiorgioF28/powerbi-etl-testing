# Reconciliation Results - ETL Validation (SQLite)

Esecuzione query su DB Browser for SQLite con tabelle importate da CSV.

## Query 1 - Riconciliazione totale revenue
source_total_revenue	transformed_total_revenue
2339.99	                2339.99
source_total_revenue: [2339.99]  
transformed_total_revenue: [2339.99]  
→ **MATCH** (differenza 0.00)


## Query 2 - Clienti senza ordini dopo ETL
customer_id	name
5	Marco Blu


## Query 3 - Ordini duplicati in transformed_orders
[0 duplicati rilevati]

## Query 4 - Ordini High Value (> 1000)
[1 order_id ORD006, customer_id 4, amount: 1200.00, reconstructed_date: 2024-4-1, product PC, Order_category: High Value]

## Query 5 - Revenue per categoria ordine (anomalie < 100)
0 righe ritornate  
→ Nessuna categoria con revenue < 100 (tutti totali superiori o categoria non popolata con valori bassi)

Note:  
- Colonna amount in transformed_orders si chiama "Somma di amount" (da esportazione Power BI)  
- Date ricostruite da Anno/Mese/Giorno  
- Eseguito il [03/03/2026:15:59], risultati coerenti con dati simulati.