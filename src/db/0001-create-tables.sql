CREATE TABLE Card_Sets (
    set_code char(3) PRIMARY KEY,
    set_name varchar(40) NOT NULL
);

CREATE TABLE Card_Rarities (
    rarity_code char(1) PRIMARY KEY,
    rarity_name varchar(11) NOT NULL
);

CREATE TABLE Cards (
    multiverse_id int PRIMARY KEY,
    set_code char(3) REFERENCES Card_Sets,
    rarity_code char(1) REFERENCES Card_Rarities
);

CREATE TABLE Card_Collector_Numbers (
    multiverse_id integer PRIMARY KEY REFERENCES Cards,
    set_code char(3) REFERENCES Card_Sets,
    collector_nbr int NOT NULL,
    UNIQUE (set_code, collector_nbr)
);

CREATE TABLE Languages (
    language_code char(2) PRIMARY KEY,
    language_name varchar(10) NOT NULL
);

CREATE TABLE Card_Conditions (
    condition_code varchar(5) PRIMARY KEY,
    condition_name varchar(20) NOT NULL,
    condition_desc varchar(1000) NOT NULL
);

CREATE TABLE Card_Inventory (
    multiverse_id int REFERENCES Cards,
    language_code char(2) REFERENCES Languages,
    condition_code varchar(5) REFERENCES Card_Conditions,
    is_foil boolean NOT NULL,
    available_qty int NOT NULL CHECK (available_qty > 0),
    PRIMARY KEY (multiverse_id, language_code, condition_code, is_foil)
);

CREATE TABLE Card_Characteristics (
    card_name varchar(141) PRIMARY KEY
);

CREATE TABLE Card_Faces (
    multiverse_id int REFERENCES Cards,
    card_name varchar(141) REFERENCES Card_Characteristics,
    PRIMARY KEY (multiverse_id, card_name)
);

CREATE TABLE Card_Colors (
    color_code char(1) PRIMARY KEY,
    color_name varchar(5) NOT NULL
);

CREATE TABLE Card_Characteristics_Colors (
    card_name varchar(141) REFERENCES Card_Characteristics,
    color_code char(1) REFERENCES Card_Colors,
    PRIMARY KEY (card_name, color_code)
);

CREATE TABLE Card_Types (
    card_type varchar(12) PRIMARY KEY
);

CREATE TABLE Card_Characteristics_Types (
    card_name varchar(141) REFERENCES Card_Characteristics,
    card_type varchar(12) REFERENCES Card_Types,
    PRIMARY KEY (card_name, card_type)
);

CREATE TABLE Card_Subtypes (
    card_subtype varchar(15) PRIMARY KEY
);

CREATE TABLE Card_Subtypes_Types (
    card_type varchar(12) REFERENCES Card_Types,
    card_subtype varchar(15) REFERENCES Card_Subtypes,
    PRIMARY KEY (card_type, card_subtype)
);

CREATE TABLE Card_Characteristics_Subtypes (
    card_name varchar(141) REFERENCES Card_Characteristics,
    card_subtype varchar(15) REFERENCES Card_Subtypes,
    card_type varchar(12) REFERENCES Card_Types,
    PRIMARY KEY (card_name, card_subtype),
    FOREIGN KEY (card_name, card_type) REFERENCES Card_Characteristics_Types,
    FOREIGN KEY (card_subtype, card_type) REFERENCES Card_Subtypes_Types
);
