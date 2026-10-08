
create table profiles (
  id uuid primary key,
  wallet_address text unique not null,
  created_at timestamp default now()
);

create table projects (
  id uuid primary key,
  name text not null,
  ticker text not null,
  description text,
  status text default 'pending',
  created_at timestamp default now()
);

create table votes (
  id uuid primary key,
  project_id uuid references projects(id),
  wallet_address text not null,
  vote boolean not null,
  created_at timestamp default now()
);

create unique index one_vote_per_wallet
on votes(project_id, wallet_address);
