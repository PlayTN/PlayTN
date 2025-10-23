# Librerie Condivise (libs)

Questa cartella contiene tutte le librerie e il codice condiviso tra le diverse applicazioni (`/apps`) del progetto.

## Scopo

L'obiettivo è evitare la duplicazione del codice e garantire la coerenza. Se una logica, una definizione o un componente è usato in più di un posto, deve essere messo qui, secondo il principio **DRY (Don't Repeat Yourself)**.

## Struttura

*   `types`: Definizioni dei tipi di dati (interfacce, classi).
*   `validation`: Logica per validare i dati.
*   `sdk`: Kit per comunicare con l'hardware (i locker).
*   `ui`: Componenti UI riutilizzabili (pulsanti, card, ecc.).
*   `i18n`: File per le traduzioni.
