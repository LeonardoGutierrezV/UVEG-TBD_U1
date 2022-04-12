/* Reto 2. Crear mi primera base de datos*/
/*Datos de identificación*/
/* Nombre completo: Leonardo Gutiérrez Vélez */
/* Matrícula: 21016418 */
/* Fecha de elaboración: 11-04-2022 */
/* Nombre del Módulo: Taller de base d edatos */
/* Nombre del Asesor: Araceli González García */

/* A manera de branch creamos un esquema indicando que para desarrollo con el prefijo seguido del nombre del esquema.
   De esta manera diferenciaremos los esquemas, como, prueba, desarrollo, y versiones alternas del mismo proyecto.
   Al esquema que se implementara en producción se omite prefijo
*/

CREATE DATABASE developer_db_store;

USE db_store;

CREATE TABLE tb_customer
( id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  address VARCHAR(50) 
);

CREATE TABLE tb_payment_method
( id INT NOT NULL PRIMARY KEY,
  type_payment VARCHAR(50) NOT NULL
);

ALTER TABLE tb_payment_method ADD COLUMN  customer_id INT;

ALTER TABLE tb_payment_method
ADD CONSTRAINT fk_type_payment
FOREIGN KEY (customer_id)
REFERENCES tb_customer ( id );

CREATE TABLE tb_purchase_order
( id INT NOT NULL PRIMARY KEY,
  payment_method INT NOT  NULL,
  customer_id INT NOT NULL, 
  CONSTRAINT fk_po_type_payment FOREIGN KEY (payment_method) REFERENCES tb_payment_method (id),
  CONSTRAINT fk_po_customer FOREIGN KEY (customer_id) REFERENCES tb_customer (id)
);

CREATE TABLE tb_store
( id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50)
);

CREATE TABLE tb_product
( id INT NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DOUBLE NOT NULL,
  description VARCHAR(150),
  store_id INT,
  CONSTRAINT fk_pr_store FOREIGN KEY (store_id) REFERENCES tb_store (id)
);

CREATE TABLE tb_purchase_order_detail
( id INT NOT NULL PRIMARY KEY,
  amount INT NOT NULL,
  price_per_unit DOUBLE NOT NULL,
  product_description VARCHAR(150),
  product_id INT NOT NULL,
  purchase_order_id INT NOT NULL,
  CONSTRAINT fk_pod_product FOREIGN KEY (product_id) REFERENCES tb_product (id),
  CONSTRAINT fk_pod_purchase_order FOREIGN KEY (purchase_order_id) REFERENCES tb_purchase_order(id)
);

