CREATE TABLE category(

		id IDENTITY,
        name  VARCHAR (50),
        description VARCHAR(255),
        image_url VARCHAR(50),
        is_active BOOLEAN,
        
        
        CONSTRAINT pk_category_id PRIMARY KEY (id)



);

INSERT INTO category (name, description, image_url, is_active) VALUES ('Laptop', 'This is the description for laptop category!', 'Cat_1.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Television', 'This is the description for television category!', 'Cat_2.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Mobile', 'This is the description for mobile category!', 'Cat_3.png', true);


CREATE TABLE user_detail (
		id IDENTITY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        role VARCHAR(50),
        enabled BOOLEAN,
        password VARCHAR(60),
        email VARCHAR(100),
        contact_number VARCHAR(15),
        
        CONSTRAINT pk_user_id PRIMARY KEY (id),
);


INSERT INTO 
user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('hachim', 'haggar', 'ADMIN', 'true', '$2a$10$1qlrJ0h2uK7AT3PKrDhigu8sqnC3bGwhzRxFk2chkFqYglxq.9g42', 'hachim@gmail.com', '8989899');

INSERT INTO 
user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('edy', 'haggar', 'SUPPLIER', 'true', '$2a$10$bZiJV.otZTz5O2fQ5DrSZ.FLzHoIkFU2drh6TcA2eKQNvgIlEVYZm', 'edy@gmail.com', '8888888');

INSERT INTO 
user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('noury', 'haggar', 'SUPPLIER', 'true', '$2a$10$bTvX4bDAP.t2laHhlENb7eRFQM8Jy8NxJd335nzWW6.EsCJZ22m/C', 'noury@gmail.com', '3343367');



CREATE TABLE product (
		id IDENTITY,
        code VARCHAR(15),
        name VARCHAR(50),
        brand VARCHAR(50),
        description VARCHAR(255),
        unit_price DECIMAL(10,2),
        quantity INT,
        is_active BOOLEAN,
        category_id INT,
        supplier_id INT,
        purchases INT DEFAULT 0,
        views INT DEFAULT 0,
        
        CONSTRAINT pk_product_id PRIMARY KEY (id),
        CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
		CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail (id),
);




INSERT INTO 
product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, views, purchases)
VALUES('PRDABC123DEFX', 'iPhone 6', 'apple','The best phone available right now on the market', '900', '10', true, 3, 2, 4, 1);


INSERT INTO 
product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, views, purchases)
VALUES('PRDDEF123DEFX', 'samsumg S7', 'Samsumg','The best phone available right now on the market', '950', '15', true, 3, 3, 2, 1);


INSERT INTO 
product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, views, purchases)
VALUES('PRDQSFF177DECX', 'One+ ', 'ONE','The best phone', '1250', '5', true, 3, 2, 7, 1);



INSERT INTO 
product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, views, purchases)
VALUES('PRDDEF121OPMC', 'Mac OS', 'Apple','The best computer available right now on the market', '7950', '115', true, 1, 2, 2, 1);



INSERT INTO 
product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, views, purchases)
VALUES('PRDSLF9998DELZ', 'Dell Sa 10', 'Dell','The best computer available right now on the market', '3500', '75', true, 1, 3, 1, 1);


CREATE TABLE address (
	
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT pk_address-id PRIMARY KEY (id)
	
	
);

CREATE TABLE cart (
	
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,0),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT pk_cart-id PRIMARY KEY (id)
	
	
);

INSERT INTO 
address	(user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping)
VALUES(2, 'EL nasr', 'EL kram', 'Tunis', 'Gov Tunis', 'Tunisie', '12345', true, true);

INSERT INTO
cart (user_id, grand_total, cart_lines) VALUES (null, 0 , 0);
