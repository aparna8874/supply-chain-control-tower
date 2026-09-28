# Supply Chain Control Tower — Results Report

## Executive Summary

This project transforms order-level supply-chain data into operational KPIs and an executive Tableau dashboard focused on shipment performance and market-level risk.

### Key results

- **65,752 unique orders**
- **$36.78M total sales**
- **3.50 average actual shipping days**
- **57.3% late-shipment rate**, using the rule `actual shipping days > scheduled shipping days`

### Market comparison

| Market | Late-shipment rate | Sales |
|---|---:|---:|
| Europe | 57.7% | $10.87M |
| Pacific Asia | 57.3% | $8.27M |
| USCA | 57.1% | $5.07M |
| LATAM | 57.0% | $10.28M |
| Africa | 56.8% | $2.29M |

The market-level late rates are relatively close to one another, so the analysis does not support treating market alone as a strong explanation for shipment delays. Further analysis should examine shipping mode, product category, vendor/product, geography, and scheduled-versus-actual timing.

## Dashboard Purpose

The Tableau Control Tower is designed to help an operations stakeholder:

1. Monitor shipment performance.
2. Compare markets.
3. Identify operational risk.
4. Explore order and product-level patterns.
5. Move from high-level KPIs into potential areas for investigation.

## Analytical Definition

A shipment is flagged late when:

`Days for shipping (real) > Days for shipment (scheduled)`

This definition is explicit so that the dashboard's KPI can be reproduced.

## Limitations

1. A late-shipment flag identifies an operational outcome but does not establish the cause of the delay.
2. Market comparisons are descriptive.
3. The dataset is historical and may not represent current operations.
4. Root-cause analysis would require additional vendor, warehouse, carrier, inventory, and exception data.

## Files

- `Python/03_Supply_Chain_Preparation.ipynb` — data preparation and KPI analysis
- `SQL/supply_chain_analysis.sql` — SQL analysis
- `Visualizations/` — supporting charts
- `Tableau_Supply_Chain_Control_Tower.twbx` — Tableau workbook
- `data/sample_supply_chain_data.csv` — lightweight sample for GitHub
