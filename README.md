# 🤖 Hermes AI Agent Deployment

Willkommen beim Deployment-Repository für den **Hermes AI Agent**. Dieses Projekt ermöglicht die automatisierte Installation eines persönlichen KI-Assistenten auf einem Hetzner Cloud Server mit Anbindung an Discord und Telegram.

## 🚀 Highlights
- **Automatisierte Installation**: Vollständig via Cloud-Init und Setup-Skript.
- **Messenger Integration**: Nahtlose Kommunikation über Discord und Telegram.
- **Langzeitgedächtnis**: Integrierte Vector-Datenbank (ChromaDB) für persistente Erinnerungen.
- **Hetzner Optimiert**: Ausgelegt für CPX31 Instanzen.

## 🛠️ Installation & Setup

### 1. Server Bestellung (Hetzner Cloud)
Erstelle einen neuen Server in der Hetzner Cloud mit folgenden Einstellungen:
- **Image:** Ubuntu 22.04 LTS
- **Typ:** CPX31 (4 vCPU, 8 GB RAM)
- **Cloud-Config:** Kopiere den Inhalt der Datei `cloud-init.json` in das Cloud-Config Feld.

### 2. Konfiguration
Sobald der Server läuft, verbinde dich per SSH (`ssh root@DEINE-IP`) und konfiguriere die API-Keys:
```bash
cd /opt/hermes-agent
nano .env
```
Trage dort deine Tokens für Discord, Telegram und dein LLM (z.B. OpenAI) ein.

### 3. Neustart
Starte die Dienste neu, um die Konfiguration zu übernehmen:
```bash
docker-compose restart
```

## 📁 Projektstruktur
- `docker-compose.yml`: Definition aller Dienste (Agent, DB, Bridges).
- `.env.example`: Vorlage für die benötigten API-Schlüssel.
- `setup.sh`: Installations-Skript für den Server.
- `cloud-init.json`: Konfiguration für das Hetzner Panel.
- `ANLEITUNG.md`: Ausführliche deutsche Installationsanleitung.

---
*Entwickelt für maximale Effizienz und Einfachheit.*
