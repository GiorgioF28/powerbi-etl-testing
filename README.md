# Power BI Report Testing & ETL Simulation

Dashboard sales/marketing multi-pagina sviluppata e testata manualmente in Power BI + validazione ETL con SQL e DAX.

## Cosa ho realizzato
- Dashboard 3 pagine: Sales Overview, Marketing Campaigns, Data Validation
- ETL pipeline testata con riconciliazione revenue (source vs transformed)
- Validazione end-to-end con misura DAX Revenue Match (✅ MATCH)
- Documentazione completa di test cases e defects

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

Progetto pensato per ruoli QA Analyst / BI Testing (es. Inetum).
