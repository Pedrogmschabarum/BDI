create table modalidade (
codmodalidade number(3) primary key,
descricao varchar(26));

select * from modalidade;

describe modalidade;

create table pessoa (
cpf number(11),
descricao varchar(30),
endereco varchar(60),
telefone number(13),
constraint pk_pessoa primary key(cpf));

create table professor(
cpf number(11),
cee varchar(10),
constraint pk_professor primary key (cpf),
constraint fk_professor foreign key (cpf) references pessoa);

create table aluno(
cpf number(11),
peso number(5,2),
altura number(3),
constraint pk_aluno primary key (cpf),
constraint fk_aluno foreign key (cpf) references pessoa);

create table dia (
coddia number(1) primary key,
dia varchar(20));

create table turma(
codturma number(4),
horainicio date,
mensalidade number(8,2),
cpf number(11),
codmodalidade number(3),
constraint pk_turma primary key (codturma),
constraint fk_turma_prof foreign key (cpf) references professor,
constraint fk_turma_modalidade foreign key (codmodalidade) references modalidade);

create table matricula (
cpf number(11),
codturma number(4),
constraint pk_matricula primary key (cpf,codturma),
constraint fk_matricula_aluno foreign key (cpf) references aluno,
constraint fk_matricula_turma foreign key (codturma) references turma);

create table ocorrencia (
codturma number(4),
coddia number(1),
constraint pk_ocorrencia primary key (coddia,codturma),
constraint fk_ocorrencia_dia foreign key (coddia) references dia,
constraint fk_ocorrencia_turma foreign key (codturma) references turma);

insert all
    into modalidade values (1,'crossfit')
    into modalidade values (2,'musculação')
    into modalidade values (3,'natação')
select 1 from dual;

insert into modalidade (codmodalidade, descricao) values (4,'ioga');
insert into modalidade values (5, 'pilates');
insert into modalidade values (6, 'patinação');
select * from modalidade;
delete from modalidade where codmodalidade <= 3;

--alter table modalidade rename column nome_antigo to nome_novo;

insert into pessoa values (1111, 'Maria', 'Chapecó - SC', 988907654);
insert into pessoa values (2222, 'João', 'Chapecó - SC', 988222222);
insert into professor values (2222, 'CEE3030');
insert into aluno values (1111, 54, 1,58);

select * from pessoa;
select * from aluno;
select * from professor;

select * from pessoa, professor where pessoa.cpf = professor.cpf;