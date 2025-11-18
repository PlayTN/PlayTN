# UrbanLock: Ecosistema di Smart Locker Modulari per la Smart City

---

## 1. Visione e Obiettivi

Creare una rete capillare di infrastrutture IoT (Internet of Things) che fungano da punti di interscambio fisici per la comunità, gestiti digitalmente. Il sistema non è proprietario di un singolo servizio, ma è un'infrastruttura "agnostica" e polifunzionale.

**Parole chiave:** Scalabilità, Flessibilità, Sicurezza (SPID/CIE), Prossimità, Connettività Pubblica.

---

## 2. Scenari d'Uso (Use Cases)

La forza del sistema sta nella personalizzazione dei moduli in base alla location.

### A. Smart Retail Hub (Commerciale B2C)
- **Funzione:** Supporto alle attività commerciali locali come estensione logistica H24.
- **Esempio:** Retail & Click & Collect in cartolerie, ferramenta, boutique, librerie.
- **Vantaggio:** Ritiro autonomo dei prodotti acquistati, anche fuori orario e senza mancate consegne a domicilio.

### B. Mobility Hub (Stazioni e Terminal Bus)
- **Funzione:** Deposito bagagli a breve termine (Left Luggage).
- **Configurazione:** Moduli XL per valigie rigide e slot lunghi per monopattini pieghevoli.

### C. Community Hub (Parchi e Aree Verdi)
- **Funzione:** "Library of Things" (Biblioteca delle cose).
- **Contenuto:** Giochi, palloni, racchette, sdraio.  
- **Logica:** Noleggio a tempo o gratuito per residenti identificati via SPID.

### D. Bike & Repair Hub (Ciclabili / Trekking)
- **Funzione:** Stazione di riparazione autonoma.
- **Contenuto:** Compressore, kit chiavi, smagliacatena, camere d'aria, kit medico.

### E. Safety & Access Hub (Piazze e Zone Turistiche)
- **Safety (DAE):** Defibrillatore accessibile, apertura immediata in emergenza (senza app).
- **Risposta Smart:** Sirena locale, telecamera, e chiamata automatica soccorso al 112 con geolocalizzazione.
- **Tourism (Key Exchange):** Gestione chiavi per affitti brevi (Airbnb/BnB) tramite codice sicuro.

### F. Digital & Connectivity Hub (Funzione Infrastrutturale)
- **Funzione:** Hotspot Wi-Fi Pubblico.
- **Servizio:** Il locker agisce come Access Point Wi-Fi gratuito per la cittadinanza (es. rete "Comune_FreeWiFi").

---

## 3. Architettura Tecnica

Il sistema si basa su tre pilastri: Hardware Modulare, App Utente, Cloud Backend.

### A. Flusso di Autenticazione e Sblocco
1. **Registrazione:** L’utente scarica l’app.
2. **KYC:** Login tramite SPID o CIE.
3. **Interazione:** L’utente si avvicina al locker.
4. **Handshake BLE:** L’app rileva il Locker ID via Bluetooth Low Energy; server genera un token crittografato; l’app invia il token al locker per l’apertura (anche offline).

### B. Stack Tecnologico
- **App Mobile:** Flutter (iOS/Android).
- **Backend:** Node.js su Cloud (AWS/GCP).
- **Database:** PostgreSQL (dati utenti) + Redis (stato slot).
- **Network Security:** Separazione (VLAN) tra traffico dati pubblico e di controllo per evitare hacking.

---

## 4. Design Hardware Modulare

Configurazione energetica ibrida e connettività ad alta capacità.

### Unità Master (Ibrida & Connessa)
- CPU di controllo industriale.
- Router 4G LTE/5G (o Fibra).
- Access Point Wi-Fi 6 Dual Band con captive portal.
- Alimentazione: rete 220V + pannello fotovoltaico integrato (“Solar Roof”) per standby e blackout.

### Unità Slave
- Colonne aggiuntive collegate a catena alla Master.

### Configurazioni Slot
- **Small (S):** Chiavi, buste, documenti.
- **Medium (M):** Caschi, scatole scarpe, zaini.
- **Large (L):** Trolley, borsoni sportivi.
- **Special (Safety):** Vetrina per DAE, termocontrollata, sensore apertura collegato all’allarme.

---

## 5. Modello di Business

- **Pay-per-use:** Tariffa oraria per deposito bagagli.
- **Abbonamenti Business (B2B):** Quota mensile per negozianti con slot garantiti.
- **Contratti Pubblici:** Il Comune paga un canone unico per:
  - Gestione Locker (Community/Safety)
  - Gestione Wi-Fi Pubblico (offloading rete cellulare)
