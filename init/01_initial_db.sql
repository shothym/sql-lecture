CREATE DATABASE IF NOT EXISTS shop;

CREATE TABLE IF NOT EXISTS shop.stock(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(255),
  item_id    INT,
  quantity   VARCHAR(255),
  created_at TIMESTAMP NOT NULL default current_timestamp,
  updated_at TIMESTAMP NOT NULL default current_timestamp on update current_timestamp
);

CREATE TABLE IF NOT EXISTS shop.item(
  id INT     PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(255),
  price      INT,
  category   VARCHAR(255),
  created_at TIMESTAMP NOT NULL default current_timestamp,
  updated_at TIMESTAMP NOT NULL default current_timestamp on update current_timestamp
);
