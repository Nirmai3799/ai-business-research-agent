AI Research Assistant with RAG

An AI-powered research assistant built using n8n, OpenAI, Supabase pgvector, Semantic Scholar, Telegram, and ElevenLabs.

This project combines Retrieval-Augmented Generation (RAG), vector search, PDF ingestion, voice interaction, and workflow automation into a multi-source AI assistant capable of answering questions from research papers and uploaded PDFs.

⸻

Features

* Research paper retrieval using Semantic Scholar API
* Google Drive PDF ingestion pipeline
* OpenAI embeddings with Supabase pgvector
* Retrieval-Augmented Generation (RAG)
* Telegram-based AI assistant
* Voice responses using ElevenLabs
* Vector similarity search
* Deduplication using paper IDs
* Multi-source knowledge base support
* Automated workflow orchestration using n8n
[3:45 pm, 17/5/2026] ~Nirmai: # AI Research Assistant with RAG

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

---

# Architecture

text                  ┌────────────────────┐                  │ Semantic Scholar   │                  └─────────┬──────────┘                            │                            ▼                   ┌─────────────────┐                   │  n8n Workflow   │                   │  Paper Ingest   │                   └────────┬────────┘                            │                            ▼                 ┌─────────────────────┐                 │ OpenAI Embeddings   │                 └─────────┬───────────┘                           │                           ▼                 ┌─────────────────────┐                 │ Supabase pgvector   │                 │ knowledge_base      │                 └─────────┬───────────┘                           │         ┌─────────────────┴─────────────────┐         │                                   │         ▼                                   ▼ ┌──────────────────┐              ┌──────────────────┐ │ Telegram Agent   │              │ ElevenLabs Voice │ └────────┬─────────┘              └────────┬─────────┘          │                                  │          └──────────────┬───────────────────┘                         ▼                ┌─────────────────┐                │ AI Agent + RAG  │                └─────────────────┘ 

---

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

# Workflows

## 1. Research Paper Ingestion Workflow

text User Query    ↓ Semantic Scholar API    ↓ Paper Metadata Extraction    ↓ Deduplication Check    ↓ Embeddings    ↓ Supabase Vector Store 

---

## 2. Google Drive PDF Ingestion Workflow

text Google Drive Trigger    ↓ Download PDF    ↓ Extract Text    ↓ Recursive Text Splitter    ↓ OpenAI Embeddings    ↓ Supabase Vector Store 

---

## 3. AI Research Assistant Workflow

text Telegram / Voice Input    ↓ AI Agent    ↓ Supabase Retriever Tool    ↓ RAG Response    ↓ Telegram / Voice Output 

---

# Supabase Setup

Enable pgvector extension:

sql create extension if not exists vector; 

Create vector table:

sql create table knowledge_base (    id bigserial primary key,    content text not null,    metadata jsonb,    embedding vector(1536),    created_at timestamptz default now() ); 

Create similarity search function:

sql create or replace function match_documents (   query_embedding vector(1536),   match_count int default 5,   filter jsonb default '{}' ) returns table (   id bigint,   content text,   metadata jsonb,   embedding jsonb,   similarity float ) language plpgsql as $$ begin   return query   select     kb.id,     kb.content,     kb.metadata,     (kb.embedding::text)::jsonb as embedding,     1 - (kb.embedding <=> query_embedding) as similarity   from knowledge_base kb   where kb.metadata @> filter   order by kb.embedding <=> query_embedding   limit match_count; end; $$; 

---

# Example Questions

text What is Retrieval-Augmented Generation?  How does RAG combine parametric and non-parametric memory?  Summarize the uploaded PDF on RAG architecture.  Compare the original RAG paper with the fine-tuned RAG approach. 

---

# Project Highlights

- Built a production-style RAG pipeline using low-code workflow orchestration
- Implemented vector similarity search using pgvector
- Integrated AI voice interaction with ElevenLabs
- Created automated PDF ingestion pipelines
- Designed a multi-source AI knowledge assistant

---

# Repository Structure

text . ├── workflows/ │   ├── research_assistant.json │   └── pdf_ingestion.json │ ├── sql/ │   └── supabase_setup.sql │ ├── screenshots/ │ ├── README.md │ └── .env.example 

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
