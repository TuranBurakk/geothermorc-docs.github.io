# GeoTherm ORC Studio — public docs (bootstrap)

Copy this folder to a **new public GitHub repo** `geothermorc-docs`. App repo stays private; no rename needed.

**Privacy policy URL (after Pages deploy):**

`https://turanburakk.github.io/geothermorc-docs/privacy-policy.html`

## Quick setup

```powershell
& "C:\Program Files\GitHub CLI\gh.exe" auth login
powershell -ExecutionPolicy Bypass -File D:\dev\powerplantcal\scripts\geothermorc-docs\SETUP.ps1
```

## Manual (GitHub web)

1. [github.com/new](https://github.com/new) → name: `geothermorc-docs` → **Public**
2. Upload or push contents of this folder (`docs/`, `.github/workflows/pages.yml`, `README.md`)
3. **Settings → Pages → Build and deployment → GitHub Actions**
4. **Actions** → run **Deploy GitHub Pages** → wait for green
5. Open privacy URL above

Play Console: paste the policy URL.  
App (sonraki build): `src/constants/urls.ts` içindeki `PRIVACY_POLICY_URL` aynı adrese güncellenmeli.
