-- Tạo database
CREATE DATABASE WEBBANTRANGSUC;
USE WEBBANTRANGSUC;
-- Tạo bảng slide
CREATE TABLE SLIDES (
  NAME_SLIDE varchar(20),
  LINK_SLIDE varchar(50)
);
-- Tạo bảng vai trò
CREATE TABLE AUTHORIZES (
  ID_AUTHORIZE INT AUTO_INCREMENT PRIMARY KEY,
  AUTHORIZE_NAME VARCHAR(20) NOT NULL
);
-- Tạo bảng chức năng
CREATE TABLE TASKS (
  ID_TASK INT AUTO_INCREMENT PRIMARY KEY,
  TASK_NAME varchar(20) NOT NULL
);
-- Tạo bảng chi tiết chức năng
CREATE TABLE PARTICULAR_TASKS (ID_TASK INT, ID_AUTHORIZE INT);
-- Tạo bảng Users
CREATE TABLE USERS (
  ID_USER INT AUTO_INCREMENT PRIMARY KEY,
  FULLNAME VARCHAR(50) NOT NULL,
  PHONE_NUMBER VARCHAR(10) NOT NULL UNIQUE,
  BIRTHDAY DATE NOT NULL
);
-- Tạo bảng Accounts
CREATE TABLE ACCOUNTS (
  ID_ACCOUNT varchar (10),
  ID_AUTHORIZE INT,
  ID_USER INT UNIQUE,
  USERNAME VARCHAR(25) UNIQUE,
  PASS_WORD VARCHAR(50),
  STATUS_ACCOUNT INT,
  CREATE_AT DATETIME DEFAULT CURRENT_TIMESTAMP,
  UPDATE_AT DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Tạo bảng loại sản phẩm
CREATE TABLE CATEGORY (
  ID_CATEGORY INT AUTO_INCREMENT PRIMARY KEY,
  CATEGORY_NAME VARCHAR(50)
);
-- Tạo bảng chất liệu sản phẩm
CREATE TABLE MATERIAL (
  ID_MATERIAL INT AUTO_INCREMENT PRIMARY KEY,
  MATERIAL_NAME VARCHAR(20)
);
-- Tạo bảng sản phẩm
CREATE TABLE PRODUCTS (
  ID_PRODUCT INT AUTO_INCREMENT PRIMARY KEY,
  ID_CATEGORY INT,
  ID_MATERIAL INT,
  PRODUCT_NAME VARCHAR(200) NOT NULL,
  MAIN_IMAGE VARCHAR (50) NOT NULL,
  QUANTITY_SOLD INT NOT NULL,
  QUANTITY_SUB_IMAGE INT,
  CREATE_AT DATETIME DEFAULT CURRENT_TIMESTAMP,
  UPDATE_AT DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Tạo bảng chi tiết sản phẩm
CREATE TABLE PARTICULAR_PRODUCTS (
  ID_PRODUCT INT,
  SIZE INT,
  PRICE FLOAT,
  QUANTITY_REMAIN INT
);
-- Tạo bảng khuyến mãi
CREATE TABLE PROMOTIONS (
  ID_PROMOTION INT AUTO_INCREMENT PRIMARY KEY,
  PROMOTION_NAME VARCHAR(50) NOT NULL,
  DISCOUNT_PERCENT FLOAT,
  DATE_START DATETIME DEFAULT CURRENT_TIMESTAMP,
  DATE_END DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Tạo bảng chi tiết khuyến mãi cho sản phẩm nào
CREATE TABLE PROMOTION_PRODUCTS (
  ID_PROMOTION_PRODUCT INT AUTO_INCREMENT PRIMARY KEY,
  ID_PROMOTION INT,
  ID_PRODUCT INT
);
-- Tạo bảng hình ảnh sản phẩm
CREATE TABLE IMAGES (ID_PRODUCT INT, LINK_IMAGE VARCHAR(50));
-- Tạo bảng giỏ hàng
CREATE TABLE CART (
  ID_CART INT AUTO_INCREMENT PRIMARY KEY,
  ID_ACCOUNT INT,
  TOTAL_PRICE_CART FLOAT
);
-- Tạo bảng chi tiết giỏ hàng
CREATE TABLE PARTICULAR_CART (
  ID_CART INT,
  ID_PRODUCT INT,
  QUANTITY INT
);
-- Tạo bảng hóa đơn
CREATE TABLE BILLS (
  ID_BILL INT AUTO_INCREMENT PRIMARY KEY,
  ID_STAFF INT,
  ID_CUSTOMER INT,
  TOTAL_BILL FLOAT,
  DATE_BILL DATETIME DEFAULT CURRENT_TIMESTAMP,
  STATUS_BILL INT
);
-- Tạo bảng chi tiết hóa đơn
CREATE TABLE PARTICULAR_BILLS (
  ID_BILL INT,
  ID_PRODUCT INT,
  QUANTITY INT
);
-- Tạo bảng đánh giá
CREATE TABLE FEEDBACKS (
  ID_FEEDBACK INT AUTO_INCREMENT PRIMARY KEY,
  ID_BILL INT,
  CONTENT VARCHAR(200),
  STAR INT(5),
  DATE_FEEDBACK DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Tạo bảng phiếu nhập
CREATE TABLE RECEIPTS (
  ID_RECEIPT INT AUTO_INCREMENT PRIMARY KEY,
  ID_STAFF INT,
  TOTAL_PRICE FLOAT,
  DATE_RECEIPT DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Tạo bảng chi tiết phiếu nhập
CREATE TABLE PARTICULAR_RECEIPTS (
  ID_RECEIPT INT,
  ID_PRODUCT INT,
  QUANTITY INT,
  PRICE FLOAT
);

CREATE TABLE categoryDecription 
(
ID_CATEGORY INT,
 BG VARCHAR (255),
 DECRIPTION TEXT (1000)
) 

-- Tạo bảng địa chỉ giao hàng cho khách hàng
CREATE TABLE USER_SHIPPING_ADDRESS (
  ID_USER_SHIPPING_ADDRESS INT AUTO_INCREMENT PRIMARY KEY,
  ID_ACCOUNT INT,
  SHIPPING_ADDRESS VARCHAR(100)
);
-- Liên kết khóa ngoại
-- Tạo khóa ngoại cho bảng chi tiết chức năng
ALTER TABLE PARTICULAR_TASKS
ADD FOREIGN KEY (ID_TASK) REFERENCES TASKS (ID_TASK) ON DELETE
SET NULL;
ALTER TABLE PARTICULAR_TASKS
ADD FOREIGN KEY (ID_AUTHORIZE) REFERENCES AUTHORIZES (ID_AUTHORIZE) ON DELETE CASCADE;
-- Tạo khoá ngoại cho bảng tài khoản
ALTER TABLE ACCOUNTS
ADD FOREIGN KEY (ID_AUTHORIZE) REFERENCES AUTHORIZES (ID_AUTHORIZE) ON DELETE
SET 1;
ALTER TABLE ACCOUNTS
ADD FOREIGN KEY (ID_USER) REFERENCES USERS (ID_USER) ON
DELETE CASCADE;
-- Tạo khóa ngoại cho bảng sản phẩm
ALTER TABLE PRODUCTS
ADD FOREIGN KEY (ID_CATEGORY) REFERENCES CATEGORY (ID_CATEGORY) ON
DELETE
SET NULL;
ALTER TABLE PRODUCTS
ADD FOREIGN KEY (ID_MATERIAL) REFERENCES MATERIAL (ID_MATERIAL) ON
DELETE
SET NULL;
-- Tạo khóa ngoại cho bảng chi tiết sản phẩm
ALTER TABLE PARTICULAR_PRODUCTS
ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID_PRODUCT) ON
DELETE CASCADE;
-- Tạo khóa ngoại cho bảng khuyến mãi
ALTER TABLE PROMOTION_PRODUCTS
ADD FOREIGN KEY (ID_PROMOTION) REFERENCES PROMOTIONS (ID_PROMOTION) ON
DELETE CASCADE;
ALTER TABLE PROMOTION_PRODUCTS
ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID_PRODUCT) ON
DELETE CASCADE;
-- Tạo khóa ngoại cho bảng hình ảnh sản phẩm
ALTER TABLE IMAGES
ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID_PRODUCT) ON
DELETE CASCADE;
-- Tạo khóa ngoại cho bảng giỏ hàng
ALTER TABLE CART
ADD FOREIGN KEY (ID_ACCOUNT) REFERENCES ACCOUNTS (ID_ACCOUNT) ON
DELETE CASCADE;
ALTER TABLE PARTICULAR_CART
ADD FOREIGN KEY (ID_CART) REFERENCES CART (ID_CART) ON
DELETE CASCADE;
ALTER TABLE PARTICULAR_CART
ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID_PRODUCT) ON
DELETE
SET NULL;
ALTER TABLE BILLS
ADD FOREIGN KEY (ID_STAFF) REFERENCES ACCOUNTS (ID_ACCOUNT) ON
DELETE
SET NULL;
ALTER TABLE BILLS
ADD FOREIGN KEY (ID_CUSTOMER) REFERENCES ACCOUNTS (ID_ACCOUNT) ON
DELETE
SET NULL;
ALTER TABLE PARTICULAR_BILLS
ADD FOREIGN KEY (ID_BILL) REFERENCES BILLS (ID_BILL) ON
DELETE CASCADE;
ALTER TABLE PARTICULAR_BILLS
ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID_PRODUCT) ON
DELETE
SET NULL;
ALTER TABLE FEEDBACKS
ADD FOREIGN KEY (ID_BILL) REFERENCES BILLS (ID_BILL) ON
DELETE
SET NULL;
ALTER TABLE RECEIPTS
ADD FOREIGN KEY (ID_STAFF) REFERENCES ACCOUNTS (ID_ACCOUNT) ON
DELETE
SET NULL;
ALTER TABLE PARTICULAR_RECEIPTS
ADD FOREIGN KEY (ID_RECEIPT) REFERENCES RECEIPTS (ID_RECEIPT) ON
DELETE CASCADE;
ALTER TABLE PARTICULAR_RECEIPTS
ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID_PRODUCT) ON
DELETE
SET NULL;
ALTER TABLE USER_SHIPPING_ADDRESS
ADD FOREIGN KEY (ID_ACCOUNT) REFERENCES ACCOUNTS (ID_ACCOUNT) ON
DELETE CASCADE;
ALTER TABLE categorydecription ADD FOREIGN KEY (ID_CATEGORY) REFERENCES category (ID_CATEGORY) ON DELETE CASCADE 
-- Tạo ra các ràng buộc toàn vẹn
-- Ràng buộc này là khi thêm 1 tài khoản mới vào database thì nó sẽ khởi tạo 1 giỏ hàng rỗng dành cho tài khoản đó
DELIMITER $$ CREATE TRIGGER insertAccount
AFTER
INSERT ON ACCOUNTS FOR EACH ROW BEGIN
INSERT INTO CART (ID_ACCOUNT, TOTAL_PRICE_CART)
VALUES (NEW.ID_ACCOUNT, 0);
END $$ DELIMITER;