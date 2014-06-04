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

alter table produtos add column imagem varchar;

create table usuarios (
	id serial primary key,
	nome varchar,
	sobrenome varchar,
	email varchar,
	senha varchar,
	senha_salt varchar,
	sexo char(1),
	dt_nascimento timestamp,
	cpf numeric(11),
	enderco varchar,
	numero numeric,
	complemento varchar,
	bairro varchar,
	cidade varchar,
	estado char(2),
	telefone varchar(10),
	telefone_opt varchar(10),
	celular varchar(11),
	foto varchar,
	confimacao boolean default false,
	situacao boolean default false,
	status boolean,
	created_at timestamp default now()
);

alter table pedidos add column usuario_id integer references usuarios(id);
alter table pedidos add column status boolean;

COMMIT;