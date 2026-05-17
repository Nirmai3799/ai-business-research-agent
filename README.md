# AI Research Assistant with RAG

An AI-powered research assistant built using n8n, OpenAI, Supabase pgvector, Semantic Scholar, Telegram, and ElevenLabs.

This project combines Retrieval-Augmented Generation (RAG), vector search, PDF ingestion, voice interaction, and workflow automation into a multi-source AI assistant capable of answering questions from research papers and uploaded PDFs.

---

# Features

- Research paper retrieval using Semantic Scholar API
- Google Drive PDF ingestion pipeline
- OpenAI embeddings with Supabase pgvector
- Retrieval-Augmented Generation (RAG)
- Telegram-based AI assistant
- Voice responses using ElevenLabs
- Vector similarity search
- Deduplication using paper IDs
- Multi-source knowledge base support
- Automated workflow orchestration using n8n

-
# Tech Stack

| Component | Technology |
|---|---|
| Workflow Automation | n8n |
| LLM | OpenAI GPT |
| Embeddings | OpenAI Embeddings |
| Vector Database | Supabase pgvector |
| Voice AI | ElevenLabs |
| Messaging | Telegram Bot |
| Research API | Semantic Scholar |
| Storage | Supabase PostgreSQL |
| PDF Source | Google Drive |

---

# Project Highlights

- Built a production-style RAG pipeline using low-code workflow orchestration
- Implemented vector similarity search using pgvector
- Integrated AI voice interaction with ElevenLabs
- Created automated PDF ingestion pipelines
- Designed a multi-source AI knowledge assistant

---

# Future Improvements

- Hybrid search (BM25 + vector search)
- Multi-user support
- Conversation memory
- Web-based frontend
- Additional ingestion sources (Notion, websites, YouTube)

---

# License

MIT License
