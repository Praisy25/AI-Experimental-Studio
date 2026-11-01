# AI Experiment Studio — free local setup

The project defaults to **local Ollama inference**. In this mode it does not send prompts to paid AI APIs, and the API rejects external provider connections and inference calls. Running on your own computer avoids hosting and database service fees; it still uses your computer, electricity, and network connection.

## Requirements

- Node.js and npm
- Docker Desktop (for the local PostgreSQL database)
- Ollama installed and running on `http://localhost:11434`
- At least one model pulled in Ollama

## Start the app

1. Start PostgreSQL from the project root:

   ```powershell
   docker compose up -d postgres
   ```

2. Copy `apps/api/.env.example` to `apps/api/.env`. Keep `ALLOW_EXTERNAL_AI=false`. Set a private `AUTH_SECRET` for your local installation. The default database URL matches `docker-compose.yml`.

3. Pull a model using Ollama. Choose a model that fits your computer’s memory and the tasks you plan to run:

   ```powershell
   ollama pull <model-name>
   ```

4. Install dependencies and start the API:

   ```powershell
   cd apps/api
   npm install
   npx prisma migrate deploy --schema schema.prisma
   npm run dev
   ```

5. In a second terminal, start the web app:

   ```powershell
   cd apps/web
   npm install
   npm run dev
   ```

6. Open `http://localhost:3000`, create an account, then select **Local Ollama** and a model installed on your machine.

## Free mode behavior

- Chat, experiments, comparisons, debate judging, research analysis, quality analysis, and prompt refinement use Ollama.
- Provider API keys are not needed for local Ollama.
- The prompt recommender uses your configured model notes, Ollama model names, local response history, and entered prices. It does not call an external model or fetch live benchmark data.
- Cost estimates use configured per-token prices. Local Ollama inference has no provider API charge, though running models requires local hardware.
- Password reset email requires SMTP configuration. Without SMTP, email delivery is unavailable.

To deliberately enable external provider APIs, set `ALLOW_EXTERNAL_AI=true` in `apps/api/.env` and restart the API. External providers can incur charges, so the project keeps them disabled by default.
