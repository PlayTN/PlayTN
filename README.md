
# UrbanLock: Ecosistema di Smart Locker Modulari per la Smart City

---

## 1. Visione e Obiettivi

Creare una rete capillare di infrastrutture IoT che fungano da punti di interscambio fisici per la comunità, gestiti digitalmente. UrbanLock non è un servizio proprietario, ma un’infrastruttura **agnostica e modulare**, flessibile e scalabile.

**Parole chiave:** Scalabilità, Flessibilità, Sicurezza (SPID/CIE), Prossimità, Connettività Pubblica.

---

## 2. Scenari d'Uso (Use Cases)

Il sistema si adatta alle diverse location grazie ai moduli personalizzabili.

### A. Smart Retail Hub (Commerciale B2C)

* **Funzione:** Supporto alle attività commerciali locali come estensione logistica H24.
* **Esempio:** Ritiro “Click & Collect” in cartolerie, ferramenta, boutique, librerie.
* **Vantaggio:** Ritiro autonomo fuori orario e senza mancate consegne a domicilio.

### B. Mobility Hub (Stazioni e Terminal Bus)

* **Funzione:** Deposito bagagli a breve termine (Left Luggage).
* **Configurazione:** Moduli XL per valigie rigide e slot lunghi per monopattini pieghevoli.

### C. Community Hub (Parchi e Aree Verdi)

* **Funzione:** “Library of Things” (Biblioteca delle cose).
* **Contenuto:** Giochi, palloni, racchette, sdraio.
* **Logica:** Noleggio a tempo o gratuito per residenti identificati tramite SPID.

### D. Bike & Repair Hub (Ciclabili / Trekking)

* **Funzione:** Stazione di riparazione autonoma.
* **Contenuto:** Compressore, kit chiavi, smagliacatena, camere d’aria, kit medico.

### E. Safety & Access Hub (Piazze e Zone Turistiche)

* **Safety (DAE):** Defibrillatore accessibile con apertura immediata in emergenza (senza app).
* **Risposta Smart:** Sirena locale, telecamera, chiamata automatica al 112 con geolocalizzazione.
* **Tourism (Key Exchange):** Gestione sicura delle chiavi per affitti brevi tramite codice protetto.

### F. Digital & Connectivity Hub (Funzione Infrastrutturale)

* **Funzione:** Hotspot Wi-Fi pubblico.
* **Servizio:** Il locker diventa Access Point Wi-Fi gratuito (“Comune_FreeWiFi”), supportando la connettività cittadina.

---

## 3. Architettura Tecnica

Il sistema si basa su tre pilastri: **Hardware Modulare, App Utente, Cloud Backend**.

### A. Flusso di Autenticazione e Sblocco

1. L’utente scarica l’app e si registra.
2. Login tramite **SPID** o **CIE**.
3. Avvicinandosi al locker, l’app rileva il **Locker ID via Bluetooth Low Energy**.
4. Il server genera un **token crittografato**.
5. L’app invia il token al locker per aprire lo slot, anche offline.

### B. Stack Tecnologico

* **App Mobile:** Flutter (iOS/Android)
* **Backend:** Node.js su Cloud (AWS/GCP)
* **Database:** PostgreSQL (dati utenti) + Redis (stato slot)
* **Sicurezza Network:** VLAN separate tra traffico dati pubblico e di controllo

---

## 4. Design Hardware Modulare

### Unità Master (Ibrida & Connessa)

* CPU industriale
* Router 4G/5G o Fibra
* Access Point Wi-Fi 6 Dual Band con captive portal
* Alimentazione: rete 220V + pannello fotovoltaico integrato (“Solar Roof”)

### Unità Slave

* Colonne aggiuntive collegate a catena alla Master

### Configurazioni Slot

* **Small (S):** Chiavi, buste, documenti
* **Medium (M):** Caschi, scarpe, zaini
* **Large (L):** Trolley, borsoni sportivi
* **Special (Safety):** Vetrina DAE, termocontrollata, sensore apertura collegato all’allarme

---

## 5. Modello di Business

* **Pay-per-use:** Tariffa oraria per deposito bagagli
* **Abbonamenti Business (B2B):** Quota mensile per negozianti con slot garantiti
* **Contratti Pubblici:** Il Comune paga un canone unico per:

  * Gestione Locker (Community/Safety)
  * Gestione Wi-Fi Pubblico (offloading rete cellulare)
