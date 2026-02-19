# GitHub Actions CI/CD - Progetto NULL

## Workflow Disponibili

### 1. CI - Test Backend (`ci.yml`)

Esegue automaticamente i test del backend su ogni push e pull request.

**Trigger:**
- Push su branch `main` o `develop`
- Pull request verso `main` o `develop`
- Solo quando ci sono modifiche in `backend/`

**Azioni:**
- Setup Node.js (versioni 18.x e 20.x)
- Installazione dipendenze
- Esecuzione test
- Generazione coverage report
- Upload risultati test

### 2. Deploy Backend (`deploy-backend.yml`)

Deploy automatico del backend dopo che i test sono passati.

**Trigger:**
- Push su branch `main`
- Esecuzione manuale (workflow_dispatch)

**Azioni:**
1. Esegue i test (job `test`)
2. Se i test passano, esegue deploy su:
   - Render (se configurato)
   - AWS (se configurato)
   - GCP (se configurato)
3. Notifica dello stato

**Secrets Richiesti:**
- `MONGODB_URI_TEST`: Database per test
- `JWT_SECRET_TEST`: Secret per test
- `RENDER_SERVICE_ID` e `RENDER_API_KEY`: Per deploy su Render
- `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`: Per deploy su AWS
- `GCP_SA_KEY`: Per deploy su GCP

### 3. CI - Test Flutter Apps (`flutter-ci.yml`)

Test e build delle app Flutter (mobile app e console admin).

**Trigger:**
- Push su branch `main` o `develop`
- Pull request verso `main` o `develop`
- Solo quando ci sono modifiche in `frontend/`

**Azioni:**
- Test app mobile
- Test console admin
- Verifica formattazione
- Analisi codice
- Build APK (solo su push su `main`)

## Configurazione

### 1. Configurare Secrets GitHub

Vai su: `Settings → Secrets and variables → Actions`

Aggiungi i secrets necessari in base alla piattaforma di deploy che usi.

### 2. Configurare Branch Protection

Per il branch `main`:
1. Vai su `Settings → Branches`
2. Aggiungi rule per `main`
3. Abilita:
   - ✅ Require a pull request before merging
   - ✅ Require status checks to pass before merging
   - ✅ Require branches to be up to date before merging
   - Seleziona i workflow che devono passare: `CI - Test Backend`

### 3. Testare i Workflow

Per testare i workflow:

```bash
# Crea un branch di test
git checkout -b test-ci

# Fai una modifica e committa
git add .
git commit -m "test: CI/CD workflow"

# Push e crea PR
git push origin test-ci
```

Poi vai su GitHub → Actions per vedere i workflow in esecuzione.

## Monitoraggio

I workflow possono essere monitorati su:
- **GitHub Actions Tab**: `https://github.com/[repo]/actions`
- **Status Badge**: Aggiungi al README.md:
  ```markdown
  ![CI](https://github.com/[repo]/workflows/CI%20-%20Test%20Backend/badge.svg)
  ```

## Troubleshooting

### Test Falliscono
- Verifica che i secrets siano configurati correttamente
- Controlla i log del workflow su GitHub Actions
- Esegui i test localmente: `cd backend && npm test`

### Deploy Non Funziona
- Verifica che i secrets per la piattaforma di deploy siano configurati
- Controlla che il servizio sulla piattaforma cloud sia configurato correttamente
- Verifica i permessi delle API keys

### Flutter Build Fallisce
- Verifica che Flutter sia installato correttamente
- Controlla che tutte le dipendenze siano aggiornate
- Esegui `flutter doctor` per diagnosticare problemi





