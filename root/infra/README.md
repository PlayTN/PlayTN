# Infrastruttura (infra)

Questa cartella contiene il codice per definire e gestire l'infrastruttura su cui girerà il nostro progetto (es. server, database), secondo l'approccio **Infrastructure as Code (IaC)**.

## Scopo

Invece di configurare i server a mano, scriviamo codice che descrive come devono essere. Questo rende il processo automatico, ripetibile e tracciabile.

## Struttura

*   `terraform` o `k8s`: Script per creare le risorse cloud.
*   `observability`: Configurazione per monitoraggio, logging e alerting.
