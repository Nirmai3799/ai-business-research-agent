create or replace function match_documents (

  query_embedding vector(1536),

  match_count int default 5,

  filter jsonb default '{}'

)

returns table (

  id bigint,

  content text,

  metadata jsonb,

  embedding jsonb,

  similarity float

)

language plpgsql

as $$

begin

  return query

  select
kb.id,

    kb.content,

    kb.metadata,

    (kb.embedding::text)::jsonb as embedding,

    1 - (kb.embedding <=> query_embedding) as similarity

  from knowledge_base kb

  where kb.metadata @> filter

  order by kb.embedding <=> query_embedding

  limit match_count;

end;

$$;
 
