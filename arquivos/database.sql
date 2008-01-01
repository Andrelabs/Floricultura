create database lojavirtualdb;

	find_by_sql("
			SELECT
			 produtos.nome,
			 produtos.preco,
			 produtos.quantidade,
			 produtos.situacao,
			 usuarios.nome AS anuciante 
			FROM 
				produtos
				INNER JOIN usuarios ON (usuarios.id = produtos.anuciante_id)
			ORDER BY
				produtos.id 
		")

BEGIN;

create table categoria_produtos (
	id serial primary key,
	nome varchar,
	situacao boolean default false,
	created_at timestamp default now()
);

create table produtos (
	id serial primary key,
	nome varchar,
	descricao varchar,
	preco decimal(10,2),
	situacao boolean default false,
	quantidade integer,
	categoria_produto_id integer references categoria_produtos(id),
	created_at timestamp default now()
);

COMMIT;
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
	rz_social varchar,
	cnpj numeric(14),	
	endereco varchar,
	cep numeric,
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
	anuciante boolean,	
	vendedor boolean,
	anuciante_id integer references usuarios(id),
	created_at timestamp default now()
);

alter table pedidos add column usuario_id integer references usuarios(id);
alter table produtos add column anuciante_id integer references usuarios(id);

COMMIT;


BEGIN;
create table status_produtos(
	id serial primary key,
	nome varchar,
	created_at timestamp default now()
	);

	insert into status_produtos (id , nome) values (1 , 'OK');
	insert into status_produtos (id , nome) values (2 , 'Alerta');
	insert into status_produtos (id , nome) values (3 , 'Critico');

create table monitors (
	id serial primary key,
	status_id integer references status_produtos(id),
	produto_id integer references produtos (id),
	created_at timestamp default now()
	);
COMMIT;