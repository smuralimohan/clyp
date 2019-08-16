

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

DROP TABLE IF EXISTS public.invoice_line_item;  
DROP TABLE IF EXISTS public.invoice_line_item_audit;

DROP TABLE IF EXISTS public.kot;
DROP TABLE IF EXISTS public.kot_audit;

DROP TABLE IF EXISTS public.bot;
DROP TABLE IF EXISTS public.bot_audit;

DROP TABLE IF EXISTS public.session_customer;

DROP TABLE IF EXISTS public.memories;  
DROP TABLE IF EXISTS public.memories_audit;

DROP TABLE IF EXISTS public.session_group;

DROP TABLE IF EXISTS public.invoice;  
DROP TABLE IF EXISTS public.invoice_audit;

DROP TABLE IF EXISTS public.session;  
DROP TABLE IF EXISTS public.session_audit;

DROP TABLE IF EXISTS public.staff;  
DROP TABLE IF EXISTS public.staff_audit;

DROP TABLE IF EXISTS public.dining_table;  
DROP TABLE IF EXISTS public.dining_table_audit;

DROP TABLE IF EXISTS public.establishment_layout;  
DROP TABLE IF EXISTS public.establishment_layout_audit;

DROP TABLE IF EXISTS public.review;  
DROP TABLE IF EXISTS public.review_audit;

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

DROP TABLE IF EXISTS public.sysuser;
DROP TABLE IF EXISTS public.sysuser_audit;

DROP TABLE IF EXISTS public.business_owner;
DROP TABLE IF EXISTS public.business_owner_audit;  

DROP TABLE IF EXISTS public.layout;
DROP TABLE IF EXISTS public.layout_audit;  

DROP TABLE IF EXISTS public.customer;
DROP TABLE IF EXISTS public.customer_audit;

DROP TABLE IF EXISTS public.tax_entity;
DROP TABLE IF EXISTS public.tax_entity_audit;

DROP TABLE IF EXISTS public.tax_component;
DROP TABLE IF EXISTS public.tax_component_audit;

DROP TABLE IF EXISTS public.tax;
DROP TABLE IF EXISTS public.tax_audit;

DROP TABLE IF EXISTS public.discount;
DROP TABLE IF EXISTS public.discount_audit;

DROP TABLE IF EXISTS public.sysconfig_custom;
DROP TABLE IF EXISTS public.sysconfig_custom_audit;

DROP TABLE IF EXISTS public.sysconfig_arr_custom;
DROP TABLE IF EXISTS public.sysconfig_arr_custom_audit;

DROP TABLE IF EXISTS public.entity;  
DROP TABLE IF EXISTS public.entity_audit;

DROP TABLE IF EXISTS public.country;

DROP TABLE IF EXISTS public.currency;

DROP TABLE IF EXISTS public.role;

DROP TABLE IF EXISTS public.rating_scale;


DROP TABLE IF EXISTS public.sysconfig;
DROP TABLE IF EXISTS public.sysconfig_audit;

DROP TABLE IF EXISTS public.sysconfig_arr;
DROP TABLE IF EXISTS public.sysconfig_arr_audit;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.sharing_type;
CREATE DOMAIN sharing_type AS TEXT
CHECK(   
   VALUE = 'NONE'
OR VALUE = 'GROUP'
OR VALUE = 'WORLD' 
);
ALTER DOMAIN sharing_type OWNER TO clyp;

DROP DOMAIN IF EXISTS public.customer_fun_foodie_type;
CREATE DOMAIN customer_fun_foodie_type AS TEXT
CHECK(   
   VALUE = 'Continental Craver'
OR VALUE = 'Die for Dosa'
OR VALUE = 'Chaat Chaat ke Chaat' 
);
ALTER DOMAIN customer_fun_foodie_type OWNER TO clyp;

DROP DOMAIN IF EXISTS public.discount_type;
CREATE DOMAIN discount_type AS TEXT
CHECK(   
   VALUE = 'PERCENT'
OR VALUE = 'ABSOLUTE'
OR VALUE = 'RULE' -- Need to create a table called discount_rule to implement this.
);
ALTER DOMAIN discount_type OWNER TO clyp;

------------------------------------------------------------------------------

DROP DOMAIN IF EXISTS public.tax_component_type;
CREATE DOMAIN tax_component_type AS TEXT
CHECK(   
   VALUE = 'PERCENT'
OR VALUE = 'ABSOLUTE'
OR VALUE = 'RULE' -- Need to create a table called tax_rule to implement this.
);
ALTER DOMAIN tax_component_type OWNER TO clyp;

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

CREATE TABLE public.country (
	iso bpchar(2) NOT NULL,
	name varchar NOT NULL,
	iso3 bpchar(3) NULL DEFAULT NULL::bpchar,
	phone_code int4 NOT NULL,
	num_code int4 NULL,
  CONSTRAINT country_pk PRIMARY KEY (iso)
);

ALTER TABLE public.country OWNER TO clyp;

INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AF','Afghanistan','AFG',93,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AL','Albania','ALB',355,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('DZ','Algeria','DZA',213,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AS','American Samoa','ASM',1684,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AD','Andorra','AND',376,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AO','Angola','AGO',244,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AI','Anguilla','AIA',1264,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AQ','Antarctica',NULL,0,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AG','Antigua and Barbuda','ATG',1268,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AR','Argentina','ARG',54,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AM','Armenia','ARM',374,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AW','Aruba','ABW',297,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AU','Australia','AUS',61,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AT','Austria','AUT',43,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AZ','Azerbaijan','AZE',994,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BS','Bahamas','BHS',1242,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BH','Bahrain','BHR',973,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BD','Bangladesh','BGD',880,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BB','Barbados','BRB',1246,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BY','Belarus','BLR',375,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BE','Belgium','BEL',32,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BZ','Belize','BLZ',501,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BJ','Benin','BEN',229,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BM','Bermuda','BMU',1441,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BT','Bhutan','BTN',975,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BO','Bolivia','BOL',591,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BA','Bosnia and Herzegovina','BIH',387,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BW','Botswana','BWA',267,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BV','Bouvet Island',NULL,0,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BR','Brazil','BRA',55,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IO','British Indian Ocean Territory',NULL,246,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BN','Brunei Darussalam','BRN',673,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BG','Bulgaria','BGR',359,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BF','Burkina Faso','BFA',226,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BI','Burundi','BDI',257,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KH','Cambodia','KHM',855,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CM','Cameroon','CMR',237,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CA','Canada','CAN',1,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CV','Cape Verde','CPV',238,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KY','Cayman Islands','CYM',1345,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CF','Central African Republic','CAF',236,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TD','Chad','TCD',235,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CL','Chile','CHL',56,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CN','China','CHN',86,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CX','Christmas Island',NULL,61,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CC','Cocos (Keeling) Islands',NULL,672,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CO','Colombia','COL',57,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KM','Comoros','COM',269,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CG','Congo','COG',242,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CD','Congo, the Democratic Republic of the','COD',242,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CK','Cook Islands','COK',682,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CR','Costa Rica','CRI',506,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CI','Cote D''Ivoire','CIV',225,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('HR','Croatia','HRV',385,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CU','Cuba','CUB',53,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CY','Cyprus','CYP',357,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CZ','Czech Republic','CZE',420,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('DK','Denmark','DNK',45,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('DJ','Djibouti','DJI',253,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('DM','Dominica','DMA',1767,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('DO','Dominican Republic','DOM',1809,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('EC','Ecuador','ECU',593,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('EG','Egypt','EGY',20,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SV','El Salvador','SLV',503,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GQ','Equatorial Guinea','GNQ',240,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ER','Eritrea','ERI',291,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('EE','Estonia','EST',372,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ET','Ethiopia','ETH',251,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('FK','Falkland Islands (Malvinas)','FLK',500,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('FO','Faroe Islands','FRO',298,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('FJ','Fiji','FJI',679,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('FI','Finland','FIN',358,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('FR','France','FRA',33,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GF','French Guiana','GUF',594,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PF','French Polynesia','PYF',689,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TF','French Southern Territories',NULL,0,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GA','Gabon','GAB',241,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GM','Gambia','GMB',220,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GE','Georgia','GEO',995,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('DE','Germany','DEU',49,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GH','Ghana','GHA',233,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GI','Gibraltar','GIB',350,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GR','Greece','GRC',30,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GL','Greenland','GRL',299,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GD','Grenada','GRD',1473,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GP','Guadeloupe','GLP',590,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GU','Guam','GUM',1671,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GT','Guatemala','GTM',502,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GN','Guinea','GIN',224,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GW','Guinea-Bissau','GNB',245,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GY','Guyana','GUY',592,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('HT','Haiti','HTI',509,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('HM','Heard Island and Mcdonald Islands',NULL,0,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('VA','Holy See (Vatican City State)','VAT',39,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('HN','Honduras','HND',504,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('HK','Hong Kong','HKG',852,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('HU','Hungary','HUN',36,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IS','Iceland','ISL',354,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IN','India','IND',91,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ID','Indonesia','IDN',62,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IR','Iran, Islamic Republic of','IRN',98,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IQ','Iraq','IRQ',964,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IE','Ireland','IRL',353,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IL','Israel','ISR',972,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IT','Italy','ITA',39,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('JM','Jamaica','JAM',1876,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('JP','Japan','JPN',81,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('JO','Jordan','JOR',962,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KZ','Kazakhstan','KAZ',7,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KE','Kenya','KEN',254,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KI','Kiribati','KIR',686,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KP','Korea, Democratic People''s Republic of','PRK',850,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KR','Korea, Republic of','KOR',82,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KW','Kuwait','KWT',965,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KG','Kyrgyzstan','KGZ',996,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LA','Lao People''s Democratic Republic','LAO',856,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LV','Latvia','LVA',371,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LB','Lebanon','LBN',961,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LS','Lesotho','LSO',266,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LR','Liberia','LBR',231,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LY','Libyan Arab Jamahiriya','LBY',218,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LI','Liechtenstein','LIE',423,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LT','Lithuania','LTU',370,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LU','Luxembourg','LUX',352,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MO','Macao','MAC',853,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MK','Macedonia, the Former Yugoslav Republic of','MKD',389,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MG','Madagascar','MDG',261,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MW','Malawi','MWI',265,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MY','Malaysia','MYS',60,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MV','Maldives','MDV',960,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ML','Mali','MLI',223,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MT','Malta','MLT',356,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MH','Marshall Islands','MHL',692,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MQ','Martinique','MTQ',596,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MR','Mauritania','MRT',222,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MU','Mauritius','MUS',230,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('YT','Mayotte',NULL,269,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MX','Mexico','MEX',52,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('FM','Micronesia, Federated States of','FSM',691,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MD','Moldova, Republic of','MDA',373,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MC','Monaco','MCO',377,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MN','Mongolia','MNG',976,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MS','Montserrat','MSR',1664,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MA','Morocco','MAR',212,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MZ','Mozambique','MOZ',258,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MM','Myanmar','MMR',95,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NA','Namibia','NAM',264,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NR','Nauru','NRU',674,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NP','Nepal','NPL',977,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NL','Netherlands','NLD',31,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AN','Netherlands Antilles','ANT',599,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NC','New Caledonia','NCL',687,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NZ','New Zealand','NZL',64,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NI','Nicaragua','NIC',505,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NE','Niger','NER',227,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NG','Nigeria','NGA',234,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NU','Niue','NIU',683,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NF','Norfolk Island','NFK',672,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MP','Northern Mariana Islands','MNP',1670,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('NO','Norway','NOR',47,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('OM','Oman','OMN',968,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PK','Pakistan','PAK',92,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PW','Palau','PLW',680,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PS','Palestinian Territory, Occupied',NULL,970,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PA','Panama','PAN',507,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PG','Papua New Guinea','PNG',675,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PY','Paraguay','PRY',595,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PE','Peru','PER',51,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PH','Philippines','PHL',63,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PN','Pitcairn','PCN',0,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PL','Poland','POL',48,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PT','Portugal','PRT',351,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PR','Puerto Rico','PRI',1787,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('QA','Qatar','QAT',974,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('RE','Reunion','REU',262,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('RO','Romania','ROM',40,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('RU','Russian Federation','RUS',70,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('RW','Rwanda','RWA',250,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SH','Saint Helena','SHN',290,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('KN','Saint Kitts and Nevis','KNA',1869,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LC','Saint Lucia','LCA',1758,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('PM','Saint Pierre and Miquelon','SPM',508,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('VC','Saint Vincent and the Grenadines','VCT',1784,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('WS','Samoa','WSM',684,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SM','San Marino','SMR',378,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ST','Sao Tome and Principe','STP',239,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SA','Saudi Arabia','SAU',966,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SN','Senegal','SEN',221,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CS','Serbia and Montenegro',NULL,381,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SC','Seychelles','SYC',248,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SL','Sierra Leone','SLE',232,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SG','Singapore','SGP',65,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SK','Slovakia','SVK',421,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SI','Slovenia','SVN',386,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SB','Solomon Islands','SLB',677,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SO','Somalia','SOM',252,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ZA','South Africa','ZAF',27,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GS','South Georgia and the South Sandwich Islands',NULL,0,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ES','Spain','ESP',34,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('LK','Sri Lanka','LKA',94,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SD','Sudan','SDN',249,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SR','Suriname','SUR',597,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SJ','Svalbard and Jan Mayen','SJM',47,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SZ','Swaziland','SWZ',268,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SE','Sweden','SWE',46,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CH','Switzerland','CHE',41,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SY','Syrian Arab Republic','SYR',963,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TW','Taiwan, Province of China','TWN',886,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TJ','Tajikistan','TJK',992,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TZ','Tanzania, United Republic of','TZA',255,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TH','Thailand','THA',66,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TL','Timor-Leste',NULL,670,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TG','Togo','TGO',228,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TK','Tokelau','TKL',690,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TO','Tonga','TON',676,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TT','Trinidad and Tobago','TTO',1868,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TN','Tunisia','TUN',216,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TR','Turkey','TUR',90,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TM','Turkmenistan','TKM',7370,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TC','Turks and Caicos Islands','TCA',1649,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('TV','Tuvalu','TUV',688,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('UG','Uganda','UGA',256,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('UA','Ukraine','UKR',380,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AE','United Arab Emirates','ARE',971,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GB','United Kingdom','GBR',44,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('US','United States','USA',1,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('UM','United States Minor Outlying Islands',NULL,1,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('UY','Uruguay','URY',598,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('UZ','Uzbekistan','UZB',998,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('VU','Vanuatu','VUT',678,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('VE','Venezuela','VEN',58,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('VN','Viet Nam','VNM',84,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('VG','Virgin Islands, British','VGB',1284,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('VI','Virgin Islands, U.s.','VIR',1340,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('WF','Wallis and Futuna','WLF',681,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('EH','Western Sahara','ESH',212,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('YE','Yemen','YEM',967,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ZM','Zambia','ZMB',260,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ZW','Zimbabwe','ZWE',263,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('RS','Serbia','SRB',381,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AP','Asia / Pacific Region','0  ',0,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('ME','Montenegro','MNE',382,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('AX','Aland Islands','ALA',358,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BQ','Bonaire, Sint Eustatius and Saba','BES',599,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('CW','Curacao','CUW',599,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('GG','Guernsey','GGY',44,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('IM','Isle of Man','IMN',44,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('JE','Jersey','JEY',44,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('XK','Kosovo','---',381,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('BL','Saint Barthelemy','BLM',590,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('MF','Saint Martin','MAF',590,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SX','Sint Maarten','SXM',1,NULL);
INSERT INTO public.country (iso,"name",iso3,phone_code,num_code) VALUES ('SS','South Sudan','SSD',211,NULL);
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

DROP SEQUENCE IF EXISTS public.rating_scale_id_seq;
CREATE SEQUENCE public.rating_scale_id_seq INCREMENT 1;
ALTER TABLE public.rating_scale_id_seq OWNER TO clyp;

CREATE TABLE public.rating_scale
(
	id int NOT NULL DEFAULT nextval('rating_scale_id_seq'::regClass),
	name character varying NOT NULL,
	value int4,
  description character varying,
	CONSTRAINT rating_scale_pk PRIMARY KEY (id)
) WITH (OIDS = FALSE);

ALTER TABLE public.rating_scale OWNER TO clyp;

INSERT INTO public.rating_scale (name, value, description) VALUES ('Binary', 2, '{"No:1","Yes:2"}');
INSERT INTO public.rating_scale (name, value, description) VALUES ('Three star', 2, '{"Not my cup of tea:1","OK:2", "Awesome:3"}');
INSERT INTO public.rating_scale (name, value, description) VALUES ('Five star', 2, '{"Not my cup of tea:1", "Expected more:2", "Not Bad:3", "Great:4", "Awesome:5"}');

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.sysconfig_id_seq;
CREATE SEQUENCE public.sysconfig_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig
(
	id int NOT NULL DEFAULT nextval('sysconfig_id_seq'::regClass),
	name character varying NOT NULL,
	bool_value boolean,
  int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_pk PRIMARY KEY (id)
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig OWNER TO clyp;

CREATE TABLE public.sysconfig_audit
(
  action char(1),	
  id bigint NOT NULL,
  name character varying NOT NULL,
  bool_value boolean,
	int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_audit();

INSERT INTO sysconfig (name, int_value) VALUES('PHOTO_LIMIT_NO', 5);
INSERT INTO sysconfig (name, bool_value) VALUES('CAN_BOOK_ALL_TABLES', TRUE);

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.sysconfig_arr_id_seq;
CREATE SEQUENCE public.sysconfig_arr_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_arr_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig_arr
(
	id int NOT NULL DEFAULT nextval('sysconfig_arr_id_seq'::regClass),
	name character varying NOT NULL,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_arr_pk PRIMARY KEY (id)
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig_arr OWNER TO clyp;

CREATE TABLE public.sysconfig_arr_audit
(
  action char(1),	
  id bigint NOT NULL,
  name character varying NOT NULL,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_arr_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_arr_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_arr_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_arr_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_arr_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_arr_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig_arr FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_arr_audit();

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
  rating_scale_id bigint,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT entity_pk PRIMARY KEY (id),
  CONSTRAINT entity_rating_scale_fk FOREIGN KEY (rating_scale_id)
  REFERENCES public.rating_scale (id) MATCH SIMPLE ON UPDATE NO ACTION 
  ON DELETE NO ACTION
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

DROP SEQUENCE IF EXISTS public.sysconfig_custom_id_seq;
CREATE SEQUENCE public.sysconfig_custom_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_custom_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig_custom
(
	id int NOT NULL DEFAULT nextval('sysconfig_custom_id_seq'::regClass),
  entity_id bigint,
  sysconfig_id bigint,
	name character varying NOT NULL,
	bool_value boolean,
  int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_custom_pk PRIMARY KEY (id),
  CONSTRAINT sysconfig_custom_entity_fk FOREIGN KEY (entity_id)
  REFERENCES entity (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT sysconfig_custom_sysconfig_fk FOREIGN KEY (sysconfig_id)
  REFERENCES sysconfig (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig_custom OWNER TO clyp;

CREATE TABLE public.sysconfig_custom_audit
(
  action char(1),	
  id bigint NOT NULL,
  entity_id bigint,
  sysconfig_id bigint,
  name character varying NOT NULL,
  bool_value boolean,
	int_value int,
  char_value character varying,
	real_value real,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_custom_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_custom_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_custom_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_custom_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_custom_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_custom_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig_custom FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_custom_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.sysconfig_arr_custom_id_seq;
CREATE SEQUENCE public.sysconfig_arr_custom_id_seq INCREMENT 1;
ALTER TABLE public.sysconfig_arr_custom_id_seq OWNER TO clyp;

CREATE TABLE public.sysconfig_arr_custom
(
	id int NOT NULL DEFAULT nextval('sysconfig_arr_custom_id_seq'::regClass),
	name character varying NOT NULL,
  entity_id bigint,
  sysconfig_arr_id bigint,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint,
  CONSTRAINT sysconfig_arr_custom_pk PRIMARY KEY (id),
  CONSTRAINT sysconfig_arr_custom_entity_fk FOREIGN KEY (entity_id)
  REFERENCES entity (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT sysconfig_arr_custom_sysconfig_arr_fk FOREIGN KEY (sysconfig_arr_id)
  REFERENCES sysconfig_arr (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
) WITH (OIDS = FALSE);

ALTER TABLE public.sysconfig_arr_custom OWNER TO clyp;

CREATE TABLE public.sysconfig_arr_custom_audit
(
  action char(1),	
  id bigint NOT NULL,
  name character varying NOT NULL,
  bool_value boolean[],
	int_value int[],
  char_value character varying[],
	real_value real[],
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.sysconfig_arr_custom_audit OWNER TO clyp;
  
CREATE OR REPLACE FUNCTION process_sysconfig_arr_custom_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO sysconfig_arr_custom_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO sysconfig_arr_custom_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO sysconfig_arr_custom_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER sysconfig_arr_custom_audit AFTER INSERT OR UPDATE OR DELETE ON sysconfig_arr_custom FOR EACH ROW EXECUTE PROCEDURE process_sysconfig_arr_custom_audit();

------------------------------------------------------------------------------

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
  foodie_type customer_fun_foodie_type[],
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
  staff_id bigint,
  tags character varying[],
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT session_pk PRIMARY KEY (id),
  CONSTRAINT session_dining_table_fk FOREIGN KEY (dining_table_id)
    REFERENCES dining_table (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT session_staff_fk FOREIGN KEY (staff_id)
    REFERENCES staff (id) MATCH SIMPLE
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

DROP SEQUENCE IF EXISTS public.memories_id_seq;
CREATE SEQUENCE public.memories_id_seq INCREMENT 1;
ALTER TABLE public.memories_id_seq OWNER TO clyp;

CREATE TABLE public.memories (
  id bigint NOT NULL DEFAULT nextval('memories_id_seq'::regClass),
  time TIMESTAMPTZ,
  customer_id bigint NOT NULL,
  session_id bigint,
  session_group_id bigint,
  image bytea,
  url character varying,
  share_with_others sharing_type,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT memories_pk PRIMARY KEY (id),
  CONSTRAINT memories_customer_fk FOREIGN KEY (customer_id)
    REFERENCES public.customer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT memories_session_fk FOREIGN KEY (session_id)
    REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT memories_session_group_fk FOREIGN KEY (session_group_id)
    REFERENCES public.session_group (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION      
 ) WITH (OIDS=FALSE);

ALTER TABLE public.memories OWNER TO clyp;

CREATE TABLE public.memories_audit (
  action char(1),
  id bigint NOT NULL,
  time TIMESTAMPTZ,
  customer_id bigint NOT NULL,
  session_id bigint,
  session_group_id bigint,
  image bytea,
  url character varying,
  share_with_others sharing_type,
  updated_at TIMESTAMPTZ,
  updated_by bigint
 ) WITH (OIDS=FALSE);

ALTER TABLE public.memories_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_memories_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO memories_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO memories_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO memories_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER memories_audit AFTER INSERT OR UPDATE OR DELETE ON memories FOR EACH ROW EXECUTE PROCEDURE process_memories_audit();  

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
  price character varying[], -- key(quantity):value(price) pair of strings.
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
  price character varying[], -- key(quantity):value(price) pair of strings. 
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

DROP SEQUENCE IF EXISTS public.kot_id_seq;
CREATE SEQUENCE public.kot_id_seq INCREMENT 1;
ALTER TABLE public.kot_id_seq OWNER TO clyp;

CREATE TABLE public.kot
(
  id bigint NOT NULL DEFAULT nextval('kot_id_seq'::regClass),
  session_id bigint,
  menu_item_id bigint,
  qty int,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT kot_pk PRIMARY KEY (id),
  CONSTRAINT kot_kitchen_menu_item_fk FOREIGN KEY (menu_item_id)
      REFERENCES public.kot (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT kot_session_fk FOREIGN KEY (session_id)
      REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kot OWNER TO clyp;
  
CREATE TABLE public.kot_audit
(
  action char(1),
  id bigint,
  session_id bigint,
  menu_item_id bigint,
  qty int,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.kot_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_kot_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO kot_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO kot_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO kot_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER kot_audit AFTER INSERT OR UPDATE OR DELETE ON kot FOR EACH ROW EXECUTE PROCEDURE process_kot_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.bot_id_seq;
CREATE SEQUENCE public.bot_id_seq INCREMENT 1;
ALTER TABLE public.bot_id_seq OWNER TO clyp;

CREATE TABLE public.bot
(
  id bigint NOT NULL DEFAULT nextval('bot_id_seq'::regClass),
  session_id bigint,
  menu_item_id bigint,
  qty character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT bot_pk PRIMARY KEY (id),
  CONSTRAINT bot_bar_menu_item_fk FOREIGN KEY (menu_item_id)
      REFERENCES public.bar_menu_item (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT bot_session_fk FOREIGN KEY (session_id)
      REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bot OWNER TO clyp;
  
CREATE TABLE public.bot_audit
(
  action char(1),
  id bigint,
  session_id bigint,
  menu_item_id bigint,
  qty character varying,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.bot_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_bot_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO bot_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO bot_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO bot_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER bot_audit AFTER INSERT OR UPDATE OR DELETE ON bot FOR EACH ROW EXECUTE PROCEDURE process_bot_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.invoice_id_seq;
CREATE SEQUENCE public.invoice_id_seq INCREMENT 1;
ALTER TABLE public.invoice_id_seq OWNER TO clyp;

CREATE TABLE public.invoice
(
  id bigint NOT NULL DEFAULT nextval('invoice_id_seq'::regClass),
  session_id bigint,
  subtotal real,
  taxes real,
  discounts real,
  total real,
  paid real,
  due real,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT invoice_pk PRIMARY KEY (id),
  CONSTRAINT invoice_session_fk FOREIGN KEY (session_id)
      REFERENCES public.session (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice OWNER TO clyp;
 
CREATE TABLE public.invoice_audit
(
  action char(1),
  id bigint,
  session_id bigint,
  subtotal real,
  taxes real,
  discounts real,
  total real,
  paid real,
  due real,
  updated_at TIMESTAMPTZ,
  updated_by bigint
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_invoice_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO invoice_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO invoice_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO invoice_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER invoice_audit AFTER INSERT OR UPDATE OR DELETE ON invoice FOR EACH ROW EXECUTE PROCEDURE process_invoice_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.invoice_line_item_id_seq;
CREATE SEQUENCE public.invoice_line_item_id_seq INCREMENT 1;
ALTER TABLE public.invoice_line_item_id_seq OWNER TO clyp;

CREATE TABLE public.invoice_line_item
(
  id bigint NOT NULL DEFAULT nextval('invoice_line_item_id_seq'::regClass),
  invoice_id bigint,
  kot_id bigint,
  bot_id bigint,
  price float,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT invoice_line_item_pk PRIMARY KEY (id),
  CONSTRAINT invoice_line_item_invoice_fk FOREIGN KEY (invoice_id)
      REFERENCES public.invoice (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT invoice_line_item_kot_fk FOREIGN KEY (kot_id)
      REFERENCES public.kot (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT invoice_line_item_bot_fk FOREIGN KEY (bot_id)
      REFERENCES public.bot (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice_line_item OWNER TO clyp;
 
CREATE TABLE public.invoice_line_item_audit
(
  action char(1),
  id bigint,
  invoice_id bigint,
  kot_id bigint,
  bot_id bigint,
  price float,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.invoice_line_item_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_invoice_line_item_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO invoice_line_item_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO invoice_line_item_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO invoice_line_item_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER invoice_line_item_audit AFTER INSERT OR UPDATE OR DELETE ON invoice_line_item FOR EACH ROW EXECUTE PROCEDURE process_invoice_line_item_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.tax_id_seq;
CREATE SEQUENCE public.tax_id_seq INCREMENT 1;
ALTER TABLE public.tax_id_seq OWNER TO clyp;

CREATE TABLE public.tax
(
  id bigint NOT NULL DEFAULT nextval('tax_id_seq'::regClass),
  country_id char(2),
  state_id character varying DEFAULT NULL,
  name character varying,
  start_date date,
  end_date date,
  is_active boolean,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT tax_pk PRIMARY KEY (id),
  CONSTRAINT tax_country_fk FOREIGN KEY (country_id)
      REFERENCES public.country (iso) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax OWNER TO clyp;
 
CREATE TABLE public.tax_audit
(
  action char(1),
  id bigint,
  country_id char(2),
  state_id character varying DEFAULT NULL,
  name character varying,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_tax_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO tax_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO tax_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO tax_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER tax_audit AFTER INSERT OR UPDATE OR DELETE ON tax FOR EACH ROW EXECUTE PROCEDURE process_tax_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.tax_component_id_seq;
CREATE SEQUENCE public.tax_component_id_seq INCREMENT 1;
ALTER TABLE public.tax_component_id_seq OWNER TO clyp;

CREATE TABLE public.tax_component
(
  id bigint NOT NULL DEFAULT nextval('tax_component_id_seq'::regClass),
  tax_id bigint,
  name character varying,
  type tax_component_type,
  value real,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT tax_component_pk PRIMARY KEY (id),
  CONSTRAINT tax_component_tax_fk FOREIGN KEY (tax_id)
      REFERENCES public.tax (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_component OWNER TO clyp;
 
CREATE TABLE public.tax_component_audit
(
  action char(1),
  id bigint,
  tax_id bigint,
  name character varying,
  type tax_component_type,
  value real,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_component_audit OWNER TO clyp;


CREATE OR REPLACE FUNCTION process_tax_component_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO tax_component_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO tax_component_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO tax_component_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER tax_component_audit AFTER INSERT OR UPDATE OR DELETE ON tax_component FOR EACH ROW EXECUTE PROCEDURE process_tax_component_audit();

------------------------------------------------------------------------------

CREATE TABLE public.tax_entity
(
  tax_id bigint,
  entity_id bigint,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT tax_entity_tax_fk FOREIGN KEY (tax_id)
      REFERENCES public.tax (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tax_entity_entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION        
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_entity OWNER TO clyp;
 
CREATE TABLE public.tax_entity_audit
(
  action char(1),
  tax_id bigint,
  entity_id bigint,
  start_date date,
  end_date date,
  is_active boolean DEFAULT TRUE,
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.tax_entity_audit OWNER TO clyp;


CREATE OR REPLACE FUNCTION process_tax_entity_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO tax_entity_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO tax_entity_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO tax_entity_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER tax_entity_audit AFTER INSERT OR UPDATE OR DELETE ON tax_entity FOR EACH ROW EXECUTE PROCEDURE process_tax_entity_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.discount_id_seq;
CREATE SEQUENCE public.discount_id_seq INCREMENT 1;
ALTER TABLE public.discount_id_seq OWNER TO clyp;

CREATE TABLE public.discount
(
  id bigint NOT NULL DEFAULT nextval('discount_id_seq'::regClass),
  entity_id bigint,
  name character varying,
  start_date date,
  end_date date,
  type discount_type,
  value real, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT discount_pk PRIMARY KEY (id),
  CONSTRAINT discount_entity_fk FOREIGN KEY (entity_id)
      REFERENCES public.entity (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.discount OWNER TO clyp;
 
CREATE TABLE public.discount_audit
(
  action char(1),
  id bigint,
  entity_id bigint,
  name character varying,
  start_date date,
  end_date date,
  type discount_type,
  value real, 
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.discount_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_discount_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO discount_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO discount_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO discount_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER discount_audit AFTER INSERT OR UPDATE OR DELETE ON discount FOR EACH ROW EXECUTE PROCEDURE process_discount_audit();

------------------------------------------------------------------------------

DROP SEQUENCE IF EXISTS public.review_id_seq;
CREATE SEQUENCE public.review_id_seq INCREMENT 1;
ALTER TABLE public.review_id_seq OWNER TO clyp;

CREATE TABLE public.review
(
  id bigint NOT NULL DEFAULT nextval('review_id_seq'::regClass),
  establishment_id bigint NOT NULL,
  kitchen_menu_item_id bigint,
  bar_menu_item_id bigint,
  customer_id bigint NOT NULL,
  comments character varying,
  rating int, 
  updated_at TIMESTAMPTZ,
  updated_by bigint,
  CONSTRAINT review_pk PRIMARY KEY (id),
  CONSTRAINT review_establishment_fk FOREIGN KEY (establishment_id)
      REFERENCES public.establishment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT review_kitchen_menu_item_fk FOREIGN KEY (kitchen_menu_item_id)
      REFERENCES public.kitchen_menu_item (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT review_bar_menu_item_fk FOREIGN KEY (bar_menu_item_id)
      REFERENCES public.bar_menu_item (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,    
  CONSTRAINT review_customer_fk FOREIGN KEY (customer_id)
      REFERENCES public.customer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION            
)
WITH ( OIDS=FALSE );

ALTER TABLE public.review OWNER TO clyp;
 
CREATE TABLE public.review_audit
(
  action char(1),
  id bigint,
  establishment_id bigint,
  menu_item_id bigint,
  customer_id bigint,
  comments character varying,
  rating int, 
  updated_at TIMESTAMPTZ,
  updated_by bigint    
)
WITH ( OIDS=FALSE );

ALTER TABLE public.review_audit OWNER TO clyp;

CREATE OR REPLACE FUNCTION process_review_audit()
RETURNS TRIGGER AS $$
BEGIN
   IF (TG_OP = 'DELETE') THEN
      INSERT INTO review_audit SELECT 'D', OLD.*;
      RETURN OLD;
   ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO review_audit SELECT 'U', NEW.*;
      RETURN NEW;
   ELSIF (TG_OP = 'INSERT') THEN
      INSERT INTO review_audit SELECT 'I', NEW.*;
      RETURN NEW;
   END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER review_audit AFTER INSERT OR UPDATE OR DELETE ON review FOR EACH ROW EXECUTE PROCEDURE process_review_audit();

------------------------------------------------------------------------------

