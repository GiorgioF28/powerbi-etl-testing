# Power BI Report Testing & ETL Simulation

Dashboard sales/marketing multi-pagina sviluppata e testata manualmente in Power BI + validazione ETL con SQL e DAX.

## Cosa ho realizzato
Pagine dashboard:
  - Sales Overview: screenshots/sales_overview.png
  - Marketing Campaigns: screenshots/marketing_campaigns.png
  - Data Validation (Revenue Match): screenshots/data_validation.png
- ETL pipeline testata con riconciliazione revenue (source vs transformed)
- Validazione end-to-end con misura DAX Revenue Match (✅ MATCH)
- Documentazione completa di test cases e defects
- Query SQL eseguite su SQLite con DB Browser for SQLite. Tabelle importate da CSV (spuntando ‘Column names in first line’).

## Tecnologie
Power BI · DAX · SQL · ETL · Data Validation

## Struttura progetto
- `powerbi/sales_marketing_dashboard.pbix` → file Power BI completo
- `data/` → CSV source (CRM + ERP simulati)
- `sql/` → query di validazione ETL
- `docs/` → test_cases.md + defects_log.md
- `screenshots/` → immagini delle 3 pagine

## Come visualizzare
1. Scarica `powerbi/sales_marketing_dashboard.pbix`
2. Apri con Power BI Desktop (gratuito)
3. Controlla Pagina 3 per la validazione Revenue Match

## Key Findings & Results

Ho eseguito le query di validazione ETL su SQLite (DB Browser for SQLite) dopo aver importato i CSV.

- **Revenue Reconciliation** (Query 1):  
  source_total_revenue: 2339.99  
  transformed_total_revenue: 2339.99  
  → **MATCH** (differenza 0.00 – riconciliazione perfetta dopo rimozione duplicati e aggiunta categoria)

- **Clienti senza ordini** (Query 2):  
  1 cliente rilevato senza ordini in transformed_orders (es. Marco Blu, customer_id 5)  
  → Defect atteso: cliente presente in CRM ma assente nelle vendite post-ETL

- **Duplicati** (Query 3):  
  0 duplicati rilevati in transformed_orders  
  → ETL ha correttamente rimosso eventuali duplicati da source

- **High Value Orders** (Query 4):  
  1 ordine trovato (>1000): amount 1200, Order_category "High Value", data ricostruita 2024-04-01  
  → Business rule applicata correttamente

- **Anomalie revenue per categoria** (Query 5):  
  0 righe ritornate (HAVING category_revenue < 100)  
  → Nessuna anomalia rilevata sotto soglia → test passato (tutti totali superiori o categoria non popolata con valori bassi)

Risultati completi e output tabelle: vedi `docs/reconciliation_results.md`

Progetto pensato per ruoli QA Analyst / BI Testing (es. Inetum).
