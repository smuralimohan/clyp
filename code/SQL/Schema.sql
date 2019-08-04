
------------------------------------------------------------------------------
--Begin of Tables--
------------------------------------------------------------------------------

DROP TABLE IF EXISTS public.role;  
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
DROP TABLE IF EXISTS public.sysuser;
DROP TABLE IF EXISTS public.sysuser_audit;  
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

DROP TABLE IF EXISTS public.business_owner;
DROP TABLE IF EXISTS public.business_owner_audit;  
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

DROP TABLE IF EXISTS public.entity;  
DROP TABLE IF EXISTS public.entity_audit;
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

DROP TABLE IF EXISTS public.business_owner_entity;  
DROP TABLE IF EXISTS public.business_owner_entity_audit;
  
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
DROP TABLE IF EXISTS public.establishment;  
DROP TABLE IF EXISTS public.establishment_audit;
DROP SEQUENCE IF EXISTS public.establishment_id_seq;

CREATE SEQUENCE public.establishment_id_seq INCREMENT 1;
ALTER TABLE public.establishment_id_seq OWNER TO clyp;

CREATE TABLE public.establishment
(
  id bigint NOT NULL DEFAULT nextval('establishment_id_seq'::regclass),
  entity_id bigint,
  establishment_no int,
  address character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT establishment_pk PRIMARY KEY (id),
  CONSTRAINT entity_fk FOREIGN KEY (entity_id)
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

DROP TABLE IF EXISTS public.staff;
DROP TABLE IF EXISTS public.staff_audit;  
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
ALTER TABLE public.staff
  OWNER TO clyp;


CREATE TABLE public.staff_audit
(
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
ALTER TABLE public.staff_audit
  OWNER TO clyp;
  
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
DROP TABLE IF EXISTS public.layout;
DROP TABLE IF EXISTS public.layout_audit;  
DROP SEQUENCE IF EXISTS public.layout_id_seq;

CREATE SEQUENCE public.layout_id_seq INCREMENT 1;
ALTER TABLE public.layout_id_seq OWNER TO clyp;

CREATE TABLE public.layout
(
  id bigint NOT NULL DEFAULT nextval('layout_id_seq'::regclass),
  name character varying,
  is_active boolean,
  establishment_id bigint,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT layout_pk PRIMARY KEY (id),  
  CONSTRAINT establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION  
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
  is_active boolean,
  establishment_id bigint,
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