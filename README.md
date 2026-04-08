# RelayPay Voice Support

Voice-based customer support agent for RelayPay — a B2B cross-border payments platform.

## Stack

| Layer | Service |
|---|---|
| Voice AI | [Vapi](https://vapi.ai) — assistant ID `61ab0bd8-3691-4efb-ae94-772e81db5008` |
| RAG Pipeline | n8n (hosted at cohort2pod2.app.n8n.cloud) |
| Knowledge Base | Supabase + pgvector (`tpszlqzmlcpyxxkyuboi`) |
| LLM | GPT-4o via OpenAI API |
| Frontend | Vanilla HTML/CSS/JS — deployed on Vercel |

## How it works

1. User clicks the mic button → Vapi opens a WebRTC audio session
2. Vapi transcribes speech → sends POST to n8n webhook
3. n8n embeds the transcript (OpenAI `text-embedding-3-small`) → queries Supabase knowledge base via cosine similarity
4. Top 5 context chunks + transcript → GPT-4o → response spoken back via Vapi
5. If escalation detected → record logged to Supabase `escalations` table + email sent to support team

## Setup

1. Get your **Vapi Public Key** from [dashboard.vapi.ai](https://dashboard.vapi.ai) → API Keys
2. Replace `YOUR_VAPI_PUBLIC_KEY_HERE` in `index.html` with it
3. Push — Vercel auto-deploys on every commit to `main`

## Environment

No environment variables needed in the frontend — all credentials are managed server-side in n8n.
