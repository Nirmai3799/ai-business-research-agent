-- Enable pgvector extension

create extension if not exists vector;

-- Create knowledge base table

create table if not exists knowledge_base (

   id bigserial primary key,

   -- Research paper metadata

   title text,

   abstract text,

   summary text,

   authors text,

   year int,

   -- Original combined content for embeddings

   content text not null,

   -- n8n metadata column

   metadata jsonb,

   -- Vector embedding

   embedding vector(1536),

   -- Metadata

   source text default 'semantic_scholar',

   created_at timestamp with time zone default now()

);

-- Create vector similarity index

create index if not exists knowledge_base_embedding_idx

on knowledge_base

using ivfflat (embedding vector_cosine_ops)

with (lists = 100);

-- Optional metadata indexes

create index if not exists knowledge_base_year_idx

on knowledge_base(year);

create index if not exists knowledge_base_source_idx

on knowledge_base(source);
 
