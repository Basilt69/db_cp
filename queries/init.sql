-- create schema
CREATE SCHEMA IF NOT EXISTS db_cp;


-- create table organisations
CREATE TABLE IF NOT EXISTS dp_cp.organisations
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying(48) COLLATE pg_catalog."default" NOT NULL,
    tin character varying(48) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT organisations_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.organisations
    OWNER to postgres;

COMMENT ON TABLE dp_cp.organisations
    IS 'организации-члены
id -организации
name - наименование
tin - ИНН
phone - контактный телефон';


-- populate table organisations
INSERT INTO dp_cp.organisations (
name, tin, phone) VALUES (
'DA ltd', round(random_number(1,120000),0), '+7495-456-123'),
('DFH gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('DFH ltd', round(random_number(1,120000),0), '+7495-456-123'),
('AFH gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('DFH LLC', round(random_number(1,120000),0), '+7495-456-123'),
('DFK ltd', round(random_number(1,120000),0), '+7495-456-123'),
('AFW gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('Marl ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Diff gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('House ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Home gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('Down LLC', round(random_number(1,120000),0), '+7495-456-123'),
('High ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Aqua gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('FFH gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('FFH ltd', round(random_number(1,120000),0), '+7495-456-123'),
('LFH gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('KLFH LLC', round(random_number(1,120000),0), '+7495-456-123'),
('KPMG ltd', round(random_number(1,120000),0), '+7495-456-123'),
('CISCO gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('Marl LLC', round(random_number(1,120000),0), '+7495-456-123'),
('Deloite ltd', round(random_number(1,120000),0), '+7495-456-123'),
('HouseMR ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Home_2 gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('DownSide LLC', round(random_number(1,120000),0), '+7495-456-123'),
('HighSCHOOL ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Aquame gmbh', round(random_number(1,120000),0), '+7495-456-123')
('DKP ltd', round(random_number(1,120000),0), '+7495-456-123'),
('AFeW gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('MarlW ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Differ gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('Houseman ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Homemade gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('Downbridge LLC', round(random_number(1,120000),0), '+7495-456-123'),
('Highback ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Aquashow gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('FFHAl gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('FFHigh ltd', round(random_number(1,120000),0), '+7495-456-123'),
('LeFtH gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('KLFM LLC', round(random_number(1,120000),0), '+7495-456-123'),
('KPMG_Q ltd', round(random_number(1,120000),0), '+7495-456-123'),
('CISCO Rus gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('Marler LLC', round(random_number(1,120000),0), '+7495-456-123'),
('DeloiteT ltd', round(random_number(1,120000),0), '+7495-456-123'),
('HouseMR2 ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Home_21 gmbh', round(random_number(1,120000),0), '+7495-456-123'),
('DownSided LLC', round(random_number(1,120000),0), '+7495-456-123'),
('HighSCH ltd', round(random_number(1,120000),0), '+7495-456-123'),
('Aquawoeld gmbh', round(random_number(1,120000),0), '+7495-456-123');


-- create table regions
CREATE TABLE IF NOT EXISTS dp_cp.regions
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    region character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT regions_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.regions
    OWNER to postgres;

COMMENT ON TABLE dp_cp.regions
    IS 'регион местонахождения организации
id - региона
region - наименование региона';

-- populate table regions
INSERT INTO dp_cp.regions (region)
VALUES ('Saint Petersburg City'),
       ('Sakhalin Oblast'),
       ('Vladimir Oblast'),
       ('Tambov Oblast'),
       ('Arkhangelsk Oblast'),
       ('Tyumen Oblast'),
       ('Moscow Oblast'),
       ('Novosibirsk Oblast'),
       ('Magadan Oblast'),
       ('Tomsk Oblast'),
       ('Lipetsk Oblast'),
       ('Omsk Oblast'),
       ('Ulyanovsk Oblast'),
       ('Leningrad Oblast'),
       ('Kurgan Oblast'),
       ('Amur Oblast'),
       ('Oryol Oblast'),
       ('Samara Oblast'),
       ('Smolensk Oblast'),
       ('Volgograd Oblast'),
       ('Kaliningrad Oblast'),
       ('Voronezh Oblast'),
       ('Vologda Oblast'),
       ('Bryansk Oblast'),
       ('Chelyabinsk Oblast'),
       ('Belgorod Oblast'),
       ('Kursk Oblast'),
       ('Kaluga Oblast'),
       ('Penza Oblast'),
       ('Orenburg Oblast'),
       ('Ivanovo Oblast'),
       ('Sverdlovsk Oblast'),
       ('Kemerovo Oblast'),
       ('Kostroma Oblast'),
       ('Astrakhan Oblast'),
       ('Rostov Oblast'),
       ('Murmansk Oblast'),
       ('Moscow City'),
       ('Sevastopol City'),
       ('Tula Oblast'),
       ('Kirov Oblast'),
       ('Ryazan Oblast'),
       ('Novgorod Oblast'),
       ('Yaroslavl Oblast'),
       ('Saratov Oblast'),
       ('Pskov Oblast'),
       ('Irkutsk Oblast'),
       ('Tver Oblast'),
       ('Nizhny Novgorod Oblast');


-- create table categories
CREATE TABLE IF NOT EXISTS dp_cp.categories
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying(48) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categories_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.categories
    OWNER to postgres;

COMMENT ON TABLE dp_cp.categories
    IS 'Категории прав
id - права
name - наименование категории права';


-- populate table categories
INSERT INTO dp_cp.categories (name)
SELECT random_string(8) as name
FROM generate_series(1, 48);


-- create table rights
CREATE TABLE IF NOT EXISTS dp_cp.rights
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    category_id bigint NOT NULL,
    name character varying(125) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT rights_pkey PRIMARY KEY (id),
    CONSTRAINT category_fkey FOREIGN KEY (category_id)
        REFERENCES dp_cp.categories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.rights
    OWNER to postgres;

COMMENT ON TABLE dp_cp.rights
    IS 'права члена организации
id - права
category_id - id категории права
name - наименование права';

-- populate table rights
INSERT INTO dp_cp.rights (category_id, name)
SELECT random_number(1, 48)::int as category_id,
       random_string(10) as name
FROM generate_series(1, 800);

-- create table intermediaries
CREATE TABLE IF NOT EXISTS dp_cp.intermediaries
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying(48) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT intermediaries_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.intermediaries
    OWNER to postgres;

COMMENT ON TABLE dp_cp.intermediaries
    IS 'Посредники, ответственные за привлечение организации
id - посредника
name - наименование посредника';

-- populate table intermediaries
INSERT INTO dp_cp.intermediaries (name)
SELECT random_string(8) as name
FROM generate_series(1, 200);


-- create table transactions
CREATE TABLE IF NOT EXISTS dp_cp.transactions
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    is_credit_card boolean NOT NULL,
    CONSTRAINT transactions_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.transactions
    OWNER to postgres;

COMMENT ON TABLE dp_cp.transactions
    IS 'транзакции по уплате взносов
id - транзакции
is_credit_card - осущетсвлена ли транзакция кредитной картой';

-- populate table transactions
INSERT INTO dp_cp.transactions (is_credit_card)
SELECT random()::int::bool as is_credit_card
FROM generate_series(1, 1000);


-- create table managers
CREATE TABLE IF NOT EXISTS dp_cp.managers
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying(48) COLLATE pg_catalog."default" NOT NULL,
    email character varying(48) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT managers_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.managers
    OWNER to postgres;

COMMENT ON TABLE dp_cp.managers
    IS 'Ответственные за управление/взаимодействие сотрудники
id - сотрудника
name - наименование
email - контактная почта';

-- populate table managers МОЁ
INSERT INTO dp_cp.managers (name, email)
SELECT random_string(8) as name,
       'manager' || random_number(1, 312)::int || '@bmstu-market.ru' as email
FROM generate_series(1, 312);


-- create table membership_data
CREATE TABLE IF NOT EXISTS dp_cp.membership_data
(
    organisation_id bigint NOT NULL,
    rights_id bigint NOT NULL,
    region_id bigint NOT NULL,
    intermediary_id bigint NOT NULL,
    transaction_id bigint NOT NULL,
    manager_id bigint NOT NULL,
    date date NOT NULL,
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    CONSTRAINT membership_data_pkey PRIMARY KEY (id),
    CONSTRAINT intermediary_fkey FOREIGN KEY (intermediary_id)
        REFERENCES dp_cp.intermediaries (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT manager_fkey FOREIGN KEY (manager_id)
        REFERENCES dp_cp.managers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT organisations_fkey FOREIGN KEY (organisation_id)
        REFERENCES dp_cp.organisations (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT region_fkey FOREIGN KEY (region_id)
        REFERENCES dp_cp.regions (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT rights_fkey FOREIGN KEY (rights_id)
        REFERENCES dp_cp.rights (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT transaction_fkey FOREIGN KEY (transaction_id)
        REFERENCES dp_cp.transactions (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dp_cp.membership_data
    OWNER to postgres;

COMMENT ON TABLE dp_cp.membership_data
    IS 'сводная таблица об организациях-членах
id - соответствующей строки
organisation_id - id организации
rights_id - id права организации
region_id - id региона местонахождения организации
intermediary_id - id посредника, ответственного за привлечение организации
transaction_id - id транзакции по уплате взноса
manager_id -id ответсвенного за управление/взаимодействие сотрудника организации
date - дата принятия в члены ';

-- populate table membership_data
INSERT INTO dp_cp.membership_data (organisation_id, rights_id, region_id, intermediary_id, transaction_id, manager_id, date)
SELECT random_number(9, 57)::int as organisation_id,
       random_number(1, 49)::int as rights_id,
       random_number(1, 49)::int as region_id,
       random_number(1, 200)::int as intermediary_id,
       random_number(1, 1000)::int as transaction_id,
       random_number(1, 312)::int as manager_id,
       '2022-01-01'::date + interval '1 days' * ceil(random() * 365) as date
FROM generate_series(1, 49);
