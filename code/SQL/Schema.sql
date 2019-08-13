

-- DROP DATABASE IF EXISTS clyp;
-- DROP ROLE IF EXISTS clyp;

-- CREATE ROLE clyp WITH
--   NOLOGIN
--   NOSUPERUSER
--   INHERIT
--   NOCREATEDB
--   NOCREATEROLE
--   NOREPLICATION;



-- CREATE DATABASE clyp
--     WITH 
--     OWNER = clyp
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'English_India.1252'
--     LC_CTYPE = 'English_India.1252'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;

------------------------------------------------------------------------------
--Begin of Tables--
------------------------------------------------------------------------------

DROP TABLE IF EXISTS public.business_owner_entity;  
DROP TABLE IF EXISTS public.business_owner_entity_audit;

DROP TABLE IF EXISTS public.staff;  
DROP TABLE IF EXISTS public.staff_audit;

DROP TABLE IF EXISTS public.session_customer;

DROP TABLE IF EXISTS public.session_group;

DROP TABLE IF EXISTS public.session;  
DROP TABLE IF EXISTS public.session_audit;

DROP TABLE IF EXISTS public.dining_table;  
DROP TABLE IF EXISTS public.dining_table_audit;

DROP TABLE IF EXISTS public.establishment_layout;  
DROP TABLE IF EXISTS public.establishment_layout_audit;

DROP TABLE IF EXISTS public.bar_menu_item;  
DROP TABLE IF EXISTS public.bar_menu_item_audit;

DROP TABLE IF EXISTS public.bar_menu;  
DROP TABLE IF EXISTS public.bar_menu_audit;

DROP TABLE IF EXISTS public.kitchen_menu_item;  
DROP TABLE IF EXISTS public.kitchen_menu_item_audit;

DROP TABLE IF EXISTS public.kitchen_menu;  
DROP TABLE IF EXISTS public.kitchen_menu_audit;

DROP TABLE IF EXISTS public.establishment;  
DROP TABLE IF EXISTS public.establishment_audit;

DROP TABLE IF EXISTS public.role;

DROP TABLE IF EXISTS public.sysuser;
DROP TABLE IF EXISTS public.sysuser_audit;

DROP TABLE IF EXISTS public.business_owner;
DROP TABLE IF EXISTS public.business_owner_audit;  

DROP TABLE IF EXISTS public.entity;  
DROP TABLE IF EXISTS public.entity_audit;

DROP TABLE IF EXISTS public.layout;
DROP TABLE IF EXISTS public.layout_audit;  

DROP TABLE IF EXISTS public.customer;
DROP TABLE IF EXISTS public.customer_audit;

DROP TABLE IF EXISTS currency;
------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.kitchen_menu_type;
CREATE DOMAIN kitchen_menu_type AS TEXT
CHECK(   
   VALUE = 'Food'
OR VALUE = 'Beverages'
OR VALUE = 'Vegetarian'
OR VALUE = 'Non-Vegetarian'
);
ALTER DOMAIN kitchen_menu_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.kitchen_menu_item_type;
CREATE DOMAIN kitchen_menu_item_type AS TEXT
CHECK(   
   VALUE = 'Chinese'
OR VALUE = 'North Indian'
OR VALUE = 'South Indian'
OR VALUE = 'Chettinad'
OR VALUE = 'Chaat'
OR VALUE = 'Dessert'
OR VALUE = 'Beverages'
OR VALUE = 'Mughlai'
);

ALTER DOMAIN kitchen_menu_item_type OWNER TO clyp;

------------------------------------------------------------------------------
DROP DOMAIN IF EXISTS public.kitchen_menu_item_subtype;
CREATE DOMAIN kitchen_menu_item_subtype AS TEXT
CHECK(   
   VALUE = 'Dairy Foods'
OR VALUE = 'Protien Foods'
OR VALUE = 'Fruits'
OR VALUE = 'Vegetables'
OR VALUE = 'Fruits/Vegetables'
);

ALTER DOMAIN kitchen_menu_item_subtype OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.bar_menu_type;
CREATE DOMAIN bar_menu_type AS TEXT
CHECK(   
   VALUE = 'Wines'
OR VALUE = 'Whiskies'
OR VALUE = 'Champagne'
OR VALUE = 'Beers'
OR VALUE = 'Cocktails'
);
ALTER DOMAIN bar_menu_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.bar_menu_item_type;
CREATE DOMAIN bar_menu_item_type AS TEXT
CHECK(   
   VALUE = 'Wines'
OR VALUE = 'Whiskies'
OR VALUE = 'Champagne'
OR VALUE = 'Snacks'
OR VALUE = 'Beers'
OR VALUE = 'Starters'
OR VALUE = 'Specials'
OR VALUE = 'Entrees'
);

ALTER DOMAIN bar_menu_item_type OWNER TO clyp;

------------------------------------------------------------------------------
DROP DOMAIN IF EXISTS public.bar_menu_item_subtype;
CREATE DOMAIN bar_menu_item_subtype AS TEXT
CHECK(   
   VALUE = 'Imported'
OR VALUE = 'Domestic'
);

ALTER DOMAIN bar_menu_item_subtype OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.est_type;
CREATE DOMAIN est_type AS TEXT
CHECK(   
   VALUE = 'Restaurant'
OR VALUE = 'Bar'
OR VALUE = 'Bar-and-Grill'
OR VALUE = 'Pub'
OR VALUE = 'Resto pub'
);
ALTER DOMAIN est_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.attraction;
CREATE DOMAIN attraction AS TEXT
CHECK(   
   VALUE = 'Rooftop'
OR VALUE = 'Poolside'
OR VALUE = 'Live Music'
OR VALUE = 'Dance'
OR VALUE = 'Smoking Zone'
);
ALTER DOMAIN attraction OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.cuisine;
CREATE DOMAIN cuisine AS TEXT
CHECK(   
   VALUE = 'Andhra'
OR VALUE = 'Assamese'
OR VALUE = 'Awadhi'
OR VALUE = 'Bengali'
OR VALUE = 'Bihari'
OR VALUE = 'Chinese'
OR VALUE = 'Continental'
OR VALUE = 'Gharwali'
OR VALUE = 'Goan'
OR VALUE = 'Gujarati'
OR VALUE = 'Himachali'
OR VALUE = 'Italian'
OR VALUE = 'Karnataka'
OR VALUE = 'Kashmiri'
OR VALUE = 'Kerala'
OR VALUE = 'Lebanese'
OR VALUE = 'Maharashtrian'
OR VALUE = 'Marwari'
OR VALUE = 'Mexican'
OR VALUE = 'Naga'
OR VALUE = 'Nepali'
OR VALUE = 'Punjabi'
OR VALUE = 'Rajasthani'
OR VALUE = 'South indian'
OR VALUE = 'Tamil'
OR VALUE = 'Thai'
);
ALTER DOMAIN cuisine OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.session_status;
CREATE DOMAIN session_status AS TEXT
CHECK(
   VALUE = 'STARTED'
OR VALUE = 'ENDED'
);
ALTER DOMAIN session_status OWNER TO clyp;

------------------------------------------------------------------------------

CREATE TABLE currency (
  name   character varying NOT NULL,
  code   character(3) NOT NULL,
  symbol character varying NOT NULL,
  CONSTRAINT currency_pk PRIMARY KEY (code)
);

INSERT INTO currency (name, code, symbol) VALUES ('Leke', 'ALL', 'Lek');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'USD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Afghanis', 'AFN', '؋');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'ARS', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Guilders', 'AWG', 'ƒ');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'AUD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('New Manats', 'AZN', 'ман');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BSD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BBD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Rubles', 'BYR', 'p.');
INSERT INTO currency (name, code, symbol) VALUES ('Euro', 'EUR', '€');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BZD', 'BZ$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BMD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Bolivianos', 'BOB', '$b');
INSERT INTO currency (name, code, symbol) VALUES ('Convertible Marka', 'BAM', 'KM');
INSERT INTO currency (name, code, symbol) VALUES ('Pula', 'BWP', 'P');
INSERT INTO currency (name, code, symbol) VALUES ('Leva', 'BGN', 'лв');
INSERT INTO currency (name, code, symbol) VALUES ('Reais', 'BRL', 'R$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'GBP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BND', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Riels', 'KHR', '៛');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'CAD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'KYD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'CLP', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Yuan Renminbi', 'CNY', '¥');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'COP', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Colón', 'CRC', '₡');
INSERT INTO currency (name, code, symbol) VALUES ('Kuna', 'HRK', 'kn');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'CUP', '₱');
INSERT INTO currency (name, code, symbol) VALUES ('Koruny', 'CZK', 'Kč');
INSERT INTO currency (name, code, symbol) VALUES ('Kroner', 'DKK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'DOP ', 'RD$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'XCD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'EGP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Colones', 'SVC', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'FKP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'FJD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Cedis', 'GHC', '¢');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'GIP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Quetzales', 'GTQ', 'Q');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'GGP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'GYD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Lempiras', 'HNL', 'L');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'HKD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Forint', 'HUF', 'Ft');
INSERT INTO currency (name, code, symbol) VALUES ('Kronur', 'ISK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'INR', 'Rp');
INSERT INTO currency (name, code, symbol) VALUES ('Rupiahs', 'IDR', 'Rp');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'IRR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'IMP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('New Shekels', 'ILS', '₪');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'JMD', 'J$');
INSERT INTO currency (name, code, symbol) VALUES ('Yen', 'JPY', '¥');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'JEP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Tenge', 'KZT', 'лв');
INSERT INTO currency (name, code, symbol) VALUES ('Won', 'KPW', '₩');
INSERT INTO currency (name, code, symbol) VALUES ('Won', 'KRW', '₩');
INSERT INTO currency (name, code, symbol) VALUES ('Soms', 'KGS', 'лв');
INSERT INTO currency (name, code, symbol) VALUES ('Kips', 'LAK', '₭');
INSERT INTO currency (name, code, symbol) VALUES ('Lati', 'LVL', 'Ls');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'LBP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'LRD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Switzerland Francs', 'CHF', 'CHF');
INSERT INTO currency (name, code, symbol) VALUES ('Litai', 'LTL', 'Lt');
INSERT INTO currency (name, code, symbol) VALUES ('Denars', 'MKD', 'ден');
INSERT INTO currency (name, code, symbol) VALUES ('Ringgits', 'MYR', 'RM');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'MUR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'MXN', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Tugriks', 'MNT', '₮');
INSERT INTO currency (name, code, symbol) VALUES ('Meticais', 'MZN', 'MT');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'NAD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'NPR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Guilders', 'ANG', 'ƒ');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'NZD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Cordobas', 'NIO', 'C$');
INSERT INTO currency (name, code, symbol) VALUES ('Nairas', 'NGN', '₦');
INSERT INTO currency (name, code, symbol) VALUES ('Krone', 'NOK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'OMR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'PKR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Balboa', 'PAB', 'B/.');
INSERT INTO currency (name, code, symbol) VALUES ('Guarani', 'PYG', 'Gs');
INSERT INTO currency (name, code, symbol) VALUES ('Nuevos Soles', 'PEN', 'S/.');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'PHP', 'Php');
INSERT INTO currency (name, code, symbol) VALUES ('Zlotych', 'PLN', 'zł');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'QAR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('New Lei', 'RON', 'lei');
INSERT INTO currency (name, code, symbol) VALUES ('Rubles', 'RUB', 'руб');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'SHP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Riyals', 'SAR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Dinars', 'RSD', 'Дин.');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'SCR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'SGD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'SBD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Shillings', 'SOS', 'S');
INSERT INTO currency (name, code, symbol) VALUES ('Rand', 'ZAR', 'R');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'LKR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Kronor', 'SEK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'SRD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'SYP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('New Dollars', 'TWD', 'NT$');
INSERT INTO currency (name, code, symbol) VALUES ('Baht', 'THB', '฿');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'TTD', 'TT$');
INSERT INTO currency (name, code, symbol) VALUES ('Lira', 'TRY', 'TL');
INSERT INTO currency (name, code, symbol) VALUES ('Liras', 'TRL', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'TVD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Hryvnia', 'UAH', '₴');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'UYU', '$U');
INSERT INTO currency (name, code, symbol) VALUES ('Sums', 'UZS', 'лв');
INSERT INTO currency (name, code, symbol) VALUES ('Bolivares Fuertes', 'VEF', 'Bs');
INSERT INTO currency (name, code, symbol) VALUES ('Dong', 'VND', '₫');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'YER', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Zimbabwe Dollars', 'ZWD', 'Z$');

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.role_id_seq;

CREATE SEQUENCE public.role_id_seq INCREMENT 1;
ALTER TABLE public.role_id_seq OWNER TO clyp;

CREATE TABLE public.role
(
	id bigint NOT NULL DEFAULT nextval('role_id_seq'::regclass),
	role_name character varying NOT NULL,
	permissions bigint,
	CONSTRAINT role_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);
ALTER TABLE public.role
  OWNER TO clyp;

INSERT INTO public.role (role_name, permissions) VALUES ('Administrator', 65535);
INSERT INTO public.role (role_name, permissions) VALUES ('Operator',7);

------------------------------------------------------------------------------
  
DROP SEQUENCE IF EXISTS public.sysuser_id_seq;

CREATE SEQUENCE public.sysuser_id_seq INCREMENT 1;
ALTER TABLE public.sysuser_id_seq OWNER TO clyp;

CREATE TABLE public.sysuser
(
  id bigint NOT NULL DEFAULT nextval('sysuser_id_seq'::regclass),
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  surname character varying,
  address character varying,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysuser_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysuser
  OWNER TO clyp;

CREATE TABLE public.sysuser_audit
(
  action char(1),	
  id bigint NOT NULL,
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  surname character varying,
  address character varying,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysuser_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysuser_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysuser_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysuser_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysuser_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysuser_audit AFTER INSERT OR UPDATE OR DELETE ON sysuser FOR EACH ROW EXECUTE PROCEDURE process_sysuser_audit();

INSERT INTO public.sysuser (username, passhash, first_name, last_name, surname, address,updated_by) 
VALUES ('smmohan', 'smmohan', 'Murali', 'Mohan', 'Saginala', '501, Brindavan Heights, Joharapuram Road, Kurnool, AP - 518002',1);

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.business_owner_id_seq;

CREATE SEQUENCE public.business_owner_id_seq INCREMENT 1;
ALTER TABLE public.business_owner_id_seq OWNER TO clyp;

CREATE TABLE public.business_owner
(
  id bigint NOT NULL DEFAULT nextval('business_owner_id_seq'::regclass),
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT business_owner_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner
  OWNER TO clyp;


CREATE TABLE public.business_owner_audit
(
  id bigint NOT NULL,
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_business_owner_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO business_owner_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO business_owner_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO business_owner_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER business_owner_audit AFTER INSERT OR UPDATE OR DELETE ON business_owner FOR EACH ROW EXECUTE PROCEDURE process_business_owner_audit();
  
------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.entity_id_seq;

CREATE SEQUENCE public.entity_id_seq INCREMENT 1;
ALTER TABLE public.entity_id_seq OWNER TO clyp;

  
CREATE TABLE public.entity
(
  id bigint NOT NULL DEFAULT nextval('entity_id_seq'::regclass),
  name character varying,
  reg_no character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT entity_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.entity
  OWNER TO clyp;

  
CREATE TABLE public.entity_audit
(
  action char(1),
  id bigint NOT NULL,
  name character varying,
  reg_no character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.entity_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_entity_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO entity_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO entity_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO entity_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER entity_audit AFTER INSERT OR UPDATE OR DELETE ON entity FOR EACH ROW EXECUTE PROCEDURE process_entity_audit();

------------------------------------------------------------------------------

  
CREATE TABLE public.business_owner_entity
(
  entity_id bigint NOT NULL,
  owner_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT owner_fk FOREIGN KEY (owner_id)
      REFERENCES public.business_owner (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner_entity
  OWNER TO clyp;
  
CREATE TABLE public.business_owner_entity_audit
(
  action char(1),
  entity_id bigint NOT NULL,
  owner_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.business_owner_entity
  OWNER TO clyp; 

CREATE OR REPLACE FUNCTION process_business_owner_entity_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO business_owner_entity_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO business_owner_entity_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO business_owner_entity_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER business_owner_entity_audit AFTER INSERT OR UPDATE OR DELETE ON business_owner_entity 
FOR EACH ROW EXECUTE PROCEDURE process_business_owner_entity_audit();

------------------------------------------------------------------------------
DROP SEQUENCE IF EXISTS public.layout_id_seq;

CREATE SEQUENCE public.layout_id_seq INCREMENT 1;
ALTER TABLE public.layout_id_seq OWNER TO clyp;

CREATE TABLE public.layout
(
  id bigint NOT NULL DEFAULT nextval('layout_id_seq'::regclass),
  name character varying,
  image bytea,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT layout_pk PRIMARY KEY (id)  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.layout
  OWNER TO clyp;

CREATE TABLE public.layout_audit
(
  action char(1),
  id bigint NOT NULL,
  name character varying,
  image bytea,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.layout_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_layout_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO layout_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO layout_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO layout_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER layout_audit AFTER INSERT OR UPDATE OR DELETE ON layout FOR EACH ROW EXECUTE PROCEDURE process_layout_audit();

------------------------------------------------------------------------------
DROP SEQUENCE IF EXISTS public.establishment_id_seq;

CREATE SEQUENCE public.establishment_id_seq INCREMENT 1;
ALTER TABLE public.establishment_id_seq OWNER TO clyp;

CREATE TABLE public.establishment
(
  id bigint NOT NULL DEFAULT nextval('establishment_id_seq'::regclass),
  entity_id bigint,
  establishment_no int,
  address character varying,
  location geography,
  cuisine_types cuisine[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT establishment_pk PRIMARY KEY (id),
  CONSTRAINT establishment_entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.establishment
  OWNER TO clyp;
  
CREATE TABLE public.establishment_audit
(
  action char(1),
  id bigint NOT NULL,
  entity_id bigint,
  establishment_no int,
  address character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.establishment_audit
  OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_establishment_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO establishment_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO establishment_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO establishment_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER establishment_audit AFTER INSERT OR UPDATE OR DELETE ON establishment 
FOR EACH ROW EXECUTE PROCEDURE process_establishment_audit();

------------------------------------------------------------------------------

CREATE TABLE public.establishment_layout
(
  layout_id bigint,
  establishment_id bigint,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT establishment_layout_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT establishment_layout_layout_fk FOREIGN KEY (layout_id)
      REFERENCES public.layout(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.establishment_layout
  OWNER TO clyp;
  
CREATE TABLE public.establishment_layout_audit
(
  action char(1),
  layout_id bigint,
  establishment_id bigint,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.establishment_layout_audit
  OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_establishment_layout_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO establishment_layout_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO establishment_layout_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO establishment_layout_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER establishment_layout_audit AFTER INSERT OR UPDATE OR DELETE ON establishment_layout 
FOR EACH ROW EXECUTE PROCEDURE process_establishment_layout_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.staff_id_seq;
CREATE SEQUENCE public.staff_id_seq INCREMENT 1;
ALTER TABLE public.staff_id_seq OWNER TO clyp;

CREATE TABLE public.staff
(
  id bigint NOT NULL DEFAULT nextval('staff_id_seq'::regclass),
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  establishment_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT staff_pk PRIMARY KEY (id),
  CONSTRAINT establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.staff OWNER TO clyp;

CREATE TABLE public.staff_audit
(
  action char(1),
  id bigint NOT NULL,
  username character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  establishment_id bigint NOT NULL,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.staff_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_staff_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO staff_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO staff_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO staff_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER staff_audit AFTER INSERT OR UPDATE OR DELETE ON staff FOR EACH ROW EXECUTE PROCEDURE process_staff_audit();
  
------------------------------------------------------------------------------
DROP SEQUENCE IF EXISTS public.dining_table_id_seq;

CREATE SEQUENCE public.dining_table_id_seq INCREMENT 1;
ALTER TABLE public.dining_table_id_seq OWNER TO clyp;

CREATE TABLE public.dining_table
(
  id bigint NOT NULL DEFAULT nextval('dining_table_id_seq'::regclass),
  type character varying,
  x int,
  y int,
  width int,
  height int,
  radius int,
  s_angle real,
  e_angle real,
  layout_id int,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT dining_table_pk PRIMARY KEY (id),
  CONSTRAINT dining_table_layout_fk FOREIGN KEY (layout_id)
      REFERENCES public.layout (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.dining_table
  OWNER TO clyp;


CREATE TABLE public.dining_table_audit
(
  action char(1),
  id bigint NOT NULL,
  type character varying,
  x int,
  y int,
  width int,
  height int,
  radius int,
  s_angle real,
  e_angle real,
  layout_id int,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.dining_table_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_dining_table_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO dining_table_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO dining_table_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO dining_table_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER dining_table_audit AFTER INSERT OR UPDATE OR DELETE ON dining_table FOR EACH ROW EXECUTE PROCEDURE process_dining_table_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.customer_id_seq;
CREATE SEQUENCE public.customer_id_seq INCREMENT 1;
ALTER TABLE public.customer_id_seq OWNER TO clyp;

CREATE TABLE public.customer
(
  id bigint NOT NULL DEFAULT nextval('customer_id_seq'::regclass),
  username character varying,
  mobile_no int,
  email character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT customer_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.customer
  OWNER TO clyp;


CREATE TABLE public.customer_audit
(
  action char(1),
  id bigint,
  username character varying,
  mobile_no int,
  email character varying,
  passhash character varying,
  first_name character varying,
  last_name character varying,
  address character varying,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.customer_audit
  OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_customer_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO customer_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO customer_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO customer_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER customer_audit AFTER INSERT OR UPDATE OR DELETE ON customer FOR EACH ROW EXECUTE PROCEDURE process_customer_audit();  

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.session_id_seq;
CREATE SEQUENCE public.session_id_seq INCREMENT 1;
ALTER TABLE public.session_id_seq OWNER TO clyp;

CREATE TABLE public.session (
  id bigint NOT NULL DEFAULT nextval('session_id_seq'::regClass),
  start_time TIMESTAMPTZ,
  end_time TIMESTAMPTZ,
  dining_table_id bigint NOT NULL,
  spend_limit real,
  status session_status,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT session_pk PRIMARY KEY (id),
  CONSTRAINT session_dining_table_fk FOREIGN KEY (dining_table_id)
    REFERENCES dining_table (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
 ) WITH (OIDS=FALSE);

ALTER TABLE public.session OWNER TO clyp;

CREATE TABLE public.session_audit (
  action char(1),
  id bigint NOT NULL,
  start_time TIMESTAMPTZ,
  end_time TIMESTAMPTZ,
  dining_table_id bigint NOT NULL,
  spend_limit real,
  status session_status,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint
 ) WITH (OIDS=FALSE);

ALTER TABLE public.session_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_session_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO session_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO session_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO session_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER session_audit AFTER INSERT OR UPDATE OR DELETE ON session FOR EACH ROW EXECUTE PROCEDURE process_session_audit();  

------------------------------------------------------------------------------

CREATE TABLE public.session_customer (
  session_id bigint NOT NULL,
  customer_id bigint NOT NULL,
  is_payer boolean,
  CONSTRAINT session_customer_customer_fk FOREIGN KEY (customer_id)
    REFERENCES customer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT session_customer_session_fk FOREIGN KEY (session_id)
    REFERENCES session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
 ) WITH (OIDS=FALSE);

ALTER TABLE public.session_customer OWNER TO clyp;

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.session_group_id_seq;
CREATE SEQUENCE public.session_group_id_seq INCREMENT 1;
ALTER TABLE public.session_group_id_seq OWNER TO clyp;

CREATE TABLE public.session_group (
  id bigint NOT NULL DEFAULT nextval('session_group_id_seq'::regClass),
  session_id bigint[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT session_group_pk PRIMARY KEY (id)
  ) WITH (OIDS=FALSE);

ALTER TABLE public.session_group OWNER TO clyp;

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.kitchen_menu_id_seq;
CREATE SEQUENCE public.kitchen_menu_id_seq INCREMENT 1;
ALTER TABLE public.kitchen_menu_id_seq OWNER TO clyp;

CREATE TABLE public.kitchen_menu
(
  id bigint NOT NULL DEFAULT nextval('kitchen_menu_id_seq'::regClass),
  establishment_id bigint,
  name character varying,
  type kitchen_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT kitchen_menu_pk PRIMARY KEY (id),
  CONSTRAINT kitchen_menu_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.kitchen_menu
  OWNER TO clyp;
  
CREATE TABLE public.kitchen_menu_audit
(
  action char(1),
  id bigint,
  establishment_id bigint,
  name character varying,
  type kitchen_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.kitchen_menu_audit
  OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_kitchen_menu_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO kitchen_menu_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO kitchen_menu_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO kitchen_menu_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER kitchen_menu_audit AFTER INSERT OR UPDATE OR DELETE ON kitchen_menu FOR EACH ROW EXECUTE PROCEDURE process_kitchen_menu_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.kitchen_menu_item_id_seq;
CREATE SEQUENCE public.kitchen_menu_item_id_seq INCREMENT 1;
ALTER TABLE public.kitchen_menu_item_id_seq OWNER TO clyp;

CREATE TABLE public.kitchen_menu_item
(
  id bigint NOT NULL DEFAULT nextval('kitchen_menu_item_id_seq'::regClass),
  menu_id bigint,
  name character varying,
  price float,
  currency character(3),
  calories int,
  serves int,
  spicy_rating int,
  description character varying,
  item_type kitchen_menu_item_type,
  item_subtype kitchen_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT kitchen_menu_item_pk PRIMARY KEY (id),
  CONSTRAINT kitchen_menu_item_kitchen_menu_fk FOREIGN KEY (menu_id)
      REFERENCES public.kitchen_menu (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT kitchen_menu_item_currency_fk FOREIGN KEY (currency)
      REFERENCES public.currency (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kitchen_menu_item OWNER TO clyp;
  
CREATE TABLE public.kitchen_menu_item_audit
(
  action char(1),
  id bigint,
  menu_id bigint,
  name character varying,
  price float,
  currency character(3),
  calories int,
  serves int,
  spicy_rating int,
  description character varying,
  item_type kitchen_menu_item_type,
  item_subtype kitchen_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kitchen_menu_item_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_kitchen_menu_item_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO kitchen_menu_item_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO kitchen_menu_item_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO kitchen_menu_item_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER kitchen_menu_item_audit AFTER INSERT OR UPDATE OR DELETE ON kitchen_menu_item FOR EACH ROW EXECUTE PROCEDURE process_kitchen_menu_item_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.bar_menu_id_seq;
CREATE SEQUENCE public.bar_menu_id_seq INCREMENT 1;
ALTER TABLE public.bar_menu_id_seq OWNER TO clyp;

CREATE TABLE public.bar_menu
(
  id bigint NOT NULL DEFAULT nextval('bar_menu_id_seq'::regClass),
  establishment_id bigint,
  name character varying,
  type bar_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT bar_menu_pk PRIMARY KEY (id),
  CONSTRAINT bar_menu_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.bar_menu OWNER TO clyp;
  
CREATE TABLE public.bar_menu_audit
(
  action char(1),
  id bigint,
  establishment_id bigint,
  name character varying,
  type bar_menu_type, 
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.bar_menu_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_bar_menu_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO bar_menu_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO bar_menu_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO bar_menu_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER bar_menu_audit AFTER INSERT OR UPDATE OR DELETE ON bar_menu FOR EACH ROW EXECUTE PROCEDURE process_bar_menu_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.bar_menu_item_id_seq;
CREATE SEQUENCE public.bar_menu_item_id_seq INCREMENT 1;
ALTER TABLE public.bar_menu_item_id_seq OWNER TO clyp;

CREATE TABLE public.bar_menu_item
(
  id bigint NOT NULL DEFAULT nextval('bar_menu_item_id_seq'::regClass),
  menu_id bigint,
  name character varying,
  currency character(3),
  price character varying[],
  description character varying,
  item_type bar_menu_item_type,
  item_subtype bar_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT bar_menu_item_pk PRIMARY KEY (id),
  CONSTRAINT bar_menu_item_bar_menu_fk FOREIGN KEY (menu_id)
      REFERENCES public.bar_menu (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT bar_menu_item_currency_fk FOREIGN KEY (currency)
      REFERENCES public.currency (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bar_menu_item OWNER TO clyp;
  
CREATE TABLE public.bar_menu_item_audit
(
  action char(1),
  id bigint,
  menu_id bigint,
  name character varying,
  currency character(3),
  price character varying[],
  description character varying,
  item_type bar_menu_item_type,
  item_subtype bar_menu_item_subtype,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bar_menu_item_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_bar_menu_item_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO bar_menu_item_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO bar_menu_item_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO bar_menu_item_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER bar_menu_item_audit AFTER INSERT OR UPDATE OR DELETE ON bar_menu_item FOR EACH ROW EXECUTE PROCEDURE process_bar_menu_item_audit();

------------------------------------------------------------------------------
