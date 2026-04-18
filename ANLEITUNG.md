# ANLEITUNG: Hermes AI Agent Installation (Hetzner Cloud)

## 🌟 Schritt 1: Das GitHub Repository
Bevor du den Server startest, musst du die Dateien in einem GitHub-Repository bereitstellen.
1. Erstelle ein neues Repository namens `hermes-agent-deploy` auf GitHub.
2. Lade folgende Dateien aus deinem lokalen Ordner hoch:
   - `docker-compose.yml`
   - `.env.example`
   - `setup.sh`
3. Stelle sicher, dass das Repository entweder **öffentlich** ist oder dass du einen SSH-Key für den Server hinterlegst.

## ☁️ Schritt 2: Server Bestellung bei Hetzner
1. Logge dich in die **Hetzner Cloud Console** ein.
2. Erstelle einen neuen Server mit folgenden Einstellungen:
   - **Location:** Wähle deinen Standort (z.B. Falkenstein).
   - **Image:** Ubuntu 22.04 LTS.
   - **Type:** CPX31 (4 vCPU, 8GB RAM).
3. **WICHTIG:** Scrolle nach unten zu **"Cloud-Config"**.
4. Kopiere den Inhalt der Datei `cloud-init.json` aus diesem Projekt und füge ihn dort ein.
5. Erstelle den Server.

## 🔑 Schritt 3: Konfiguration der API-Keys
Nachdem der Server gestartet ist (dauert ca. 5-10 Min.), musst du deine Keys eintragen:
1. Verbinde dich per SSH mit deinem Server: `ssh root@DEINE_S-IP`
2. Gehe in das Verzeichnis: `cd /opt/hermes-agent`
3. Öffne die Umgebungsvariablen: `nano .env`
4. Trage deine Tokens ein:
   - `DISCORD_TOKEN`: Dein Discord Bot Token.
   - `TELEGRAM_BOT_TOKEN`: Dein Bot-Token vom @BotFather.
   - `LLM_API_KEY`: Dein OpenAI oder anderer KI-Key.
5. Speichere die Datei (`Strg+O`, `Enter`, `Strg+X`).
6. Starte den Agenten neu: `docker-compose restart`

## 🛠️ Fehlerbehebung
- **Logs prüfen:** `docker-compose logs -f`
- **Neustart:** `docker-compose down && docker-compose up -d`

