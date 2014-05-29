create database lojavirtualdb;

BEGIN;

create table produtos (
	id serial primary key,
	nome varchar,
	descricao varchar,
	preco decimal(10,2),
	situacao boolean default false,
	quantidade integer,
	created_at timestamp default now()
);

create table pedidos (
	id serial primary key,
	estado varchar default 'carrinho',
	total decimal(10,2),
	created_at timestamp default now()
);

create table itens(
	id serial primary key,
	pedido_id integer references pedidos(id),
	produto_id integer references produtos(id),
	quantidade integer
	);

create index pedido_id_idx on itens(pedido_id);


COMMIT;