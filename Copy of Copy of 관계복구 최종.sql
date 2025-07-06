CREATE TABLE `Shipment_related_code` (
	`shipment_status`	INT	NOT NULL,
	`code_group_num`	TINYINT	NULL,
	`code_id`	TINYINT	NULL,
	`code_name(ex. pending)`	VARCHAR(100)	NULL,
	`description`	VARCHAR(500)	NULL,
	`created_at`	DATETIME	NULL
);

CREATE TABLE `PRODUCT_STOCK` (
	`product_variant_stock_id`	BIGINT	NOT NULL,
	`PRODUCT_STOCK_STATUS`	VARCHAR(255)	NULL,
	`PRODUCT_STOCK`	INT	NULL
);

CREATE TABLE `ORDERS` (
	`order_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`user_coupon_id`	BIGINT	NOT NULL,
	`order_num`	VARCHAR(50)	NULL,
	`total_count`	INT	NULL,
	`total_price`	DECIMAL(12,2)	NULL,
	`use_mile`	DECIMAL(10,2)	NULL,
	`order_amount`	DECIMAL(12,2)	NULL,
	`shipping_fee`	DECIMAL(8,2)	NULL,
	`discount_amount`	DECIMAL(10,2)	NULL,
	`final_amount`	DECIMAL(12,2)	NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`id2`	BIGINT	NOT NULL
);

CREATE TABLE `Inquiry` (
	`inquiry_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`product_id`	BIGINT	NULL,
	`title`	VARCHAR(200)	NULL,
	`content`	TEXT	NULL,
	`inquiry_category`	ENUM('product', 'delivery', 'payment', 'refund', 'etc')	NULL	DEFAULT 'product',
	`status`	ENUM('pending', 'answered', 'closed')	NULL	DEFAULT 'pending',
	`is_secret`	TINYINT(1)	NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL
);

CREATE TABLE `Return` (
	`return_id`	BIGINT	NOT NULL,
	`order_id`	BIGINT	NOT NULL	COMMENT '주문에 고객정보 있음',
	`approve_admin_id`	BIGINT	NOT NULL,
	`shipment_id`	VARCHAR(50)	NOT NULL,
	`return_judgement`	VARCHAR(500)	NULL,
	`judgment_reason`	VARCHAR(500)	NULL,
	`refund_option_code`	INT	NULL	DEFAULT 'refund',
	`return_reason_code`	INT	NULL,
	`reason_detail`	VARCHAR(500)	NULL,
	`requested_at`	TIMESTAMP	NULL,
	`completed_at`	TIMESTAMP	NULL,
	`Field`	VARCHAR(255)	NULL
);

CREATE TABLE `review_like` (
	`like_id`	BIGINT	NOT NULL,
	`review_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`created_at`	DATETIME	NOT NULL,
	`is_deleted`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL
);

CREATE TABLE `USERS` (
	`user_id`	BIGINT	NOT NULL,
	`role_id`	UUID	NOT NULL,
	`login_id`	VARCHAR(20)	NULL,
	`password`	VARCHAR(255)	NULL,
	`is_activate`	TINYINT(1)	NULL,
	`is_auth_locked`	TINYINT(1)	NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL,
	`is_deleted`	TINYINT(1)	NULL
);

CREATE TABLE `ADMIN_DETAIL` (
	`user_id`	BIGINT	NOT NULL,
	`nickname`	VARCHAR(255)	NULL,
	`created_at`	DATETIME	NULL
);

CREATE TABLE `special_section` (
	`special_id`	VARCHAR2(2)	NOT NULL,
	`name`	VARCHAR2(100)	NULL,
	`sort_order`	int	NULL,
	`is_active`	TINYINT	NULL
);

CREATE TABLE `role-permission` (
	`id`	BIGINT	NOT NULL,
	`role_id`	UUID	NOT NULL,
	`permission_id`	UUID	NOT NULL
);

CREATE TABLE `Order_state_code` (
	`order_status_code_id[`	BIGINT	NOT NULL,
	`order_status_name_id`	VARCHAR(50)	NULL
);

CREATE TABLE `user_terms_agreement` (
	`agreement_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`terms_id`	BIGINT	NOT NULL,
	`agreed_at`	DATETIME	NULL,
	`ip_address`	VARCHAR(45)	NULL
);

CREATE TABLE `product` (
	`product_id`	BIGINT	NOT NULL,
	`category_lv3_id`	varchar2(2)	NOT NULL,
	`title`	VARCHAR(200)	NOT NULL,
	`price`	DECIMAL(10,2)	NOT NULL,
	`summary`	VARCHAR(500)	NULL,
	`description`	TEXT	NULL,
	`thumbnail`	VARCHAR(255)	NULL,
	`tags`	VARCHAR(255)	NULL,
	`seasons`	BIT(4)	NOT NULL	DEFAULT '0000',
	`average_rating`	DECIMAL(3,1)	NULL,
	`sales_count`	INT	NULL,
	`view_count`	INT	NULL,
	`stock_quantity`	INT	NULL,
	`availability_date`	DATETIME	NULL,
	`enabled`	BIT(1)	NOT NULL	DEFAULT '1',
	`created_at`	DATETIME	NOT NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL,
	`is_deleted`	DATETIME	NULL
);

CREATE TABLE `bank` (
	`bank_id`	BIGINT	NOT NULL,
	`name`	VARCHAR	NULL,
	`is_active`	TINYINT(1)	NULL
);

CREATE TABLE `product_variant` (
	`product_variant_id`	BIGINT	NOT NULL,
	`product_id`	BIGINT	NOT NULL,
	`product_variant_stock_id`	BIGINT	NOT NULL,
	`size_id`	BIGINT	NOT NULL,
	`color_id`	BIGINT	NOT NULL,
	`created_at`	DATETIME	NOT NULL,
	`product_vartient_weight`	Varchat(255)	NULL,
	`product_varient_measurement`	varchar	NULL,
	`Product_variant_extra_charge`	DECIMAL	NULL,
	`PRODUCT_VRAITANT_FABRIC_INFO`	Varchat(255)	NULL,
	`PRODUCT_VRAITANT_FABRIC_CARE_INFO`	Varchat(255)	NULL
);

CREATE TABLE `ORDER_HISTORY` (
	`history_id`	BIGINT	NOT NULL,
	`order_id`	BIGINT	NOT NULL,
	`order_item_id`	BIGINT	NOT NULL,
	`status`	VARCHAR(50)	NULL,
	`comment`	TEXT	NULL,
	`created_at`	TIMESTAMP	NULL,
	`created_by`	VARCHAR(255)	NULL,
	`id2`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `USER_COUPON` (
	`user_coupon_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`coupon_id`	BIGINT	NOT NULL,
	`coupon_code`	VARCHAR(50)	NULL,
	`issued_at`	DATETIME	NULL,
	`is_used`	TINYINT(1)	NULL,
	`used_at`	DATETIME	NULL,
	`coupon_num`	BIGINT	NULL,
	`created_at`	DATETIME	NULL,
	`expire_at`	DATETIME	NULL,
	`deleted_at`	DATETIME	NULL
);

CREATE TABLE `review` (
	`review_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`product_id`	BIGINT	NOT NULL,
	`purchase_id`	VARCHAR(255)	NOT NULL,
	`rating`	TINYINT(1)	NOT NULL,
	`title`	VARCHAR(200)	NULL,
	`content`	TEXT	NULL,
	`img_url`	TEXT	NULL,
	`like_count`	INT(10)	NOT NULL,
	`state`	ENUM('auto', 'pending', 'approved', 'rejected')	NOT NULL	DEFAULT 'auto',
	`reject_resaon`	TEXT	NULL,
	`is_deleted`	TINYINT(1)	NULL,
	`approved_at`	DATETIME	NULL,
	`created_at`	DATETIME	NOT NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL
);

CREATE TABLE `lv1` (
	`lv1_id`	varchar2(2)	NOT NULL,
	`name`	varchar2(100)	NULL,
	`sort_order`	int	NULL,
	`is_active`	char(1)	NULL
);

CREATE TABLE `Delivery_Company_API` (
	`delivery_company_id`	VARCHAR(50)	NOT NULL,
	`company_name`	VARCHAR(100)	NULL,
	`api_url`	VARCHAR(255)	NULL,
	`api_key`	VARCHAR(255)	NULL,
	`company_code`	VARCHAR(20)	NULL,
	`created_at`	DATETIME	NULL
);

CREATE TABLE `review_comment` (
	`comment_id`	INT	NOT NULL,
	`review_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NULL,
	`parent_id`	INT	NULL,
	`depth`	INT	NULL,
	`content`	TEXT	NOT NULL,
	`is_deleted`	TINYINT(1)	NOT NULL,
	`created_at`	DATETIME	NOT NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL
);

CREATE TABLE `PAYMENT` (
	`payment_id`	BIGINT	NOT NULL,
	`order_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NULL,
	`order_num`	VARCHAR(50)	NULL,
	`paid_amount`	DECIMAL(12,2)	NULL,
	`cash_receipt`	ENUM( Y, N )	NULL,
	`pg_transaction_id`	VARCHAR(100)	NULL,
	`payment_key`	VARCHAR(100)	NULL,
	`receipt_url`	VARCHAR(500)	NULL,
	`created_at`	TIMESTAMP	NULL,
	`updated_at`	TIMESTAMP	NULL	DEFAULT CURRENT_TIMESTAMP,
	`approved_at`	TIMESTAMP	NULL,
	`cancelled_at`	TIMESTAMP	NULL,
	`pg_id`	BIGINT	NOT NULL,
	`pay_status_id`	BIGINT	NOT NULL,
	`pay_type_id`	BIGINT	NOT NULL
);

CREATE TABLE `inquiry_answer` (
	`inquiry_answer_id`	BIGINT	NOT NULL,
	`inquiry_id`	BIGINT	NOT NULL,
	`admin_id`	BIGINT	NOT NULL,
	`content`	TEXT	NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `default_user_address` (
	`user_id`	BIGINT	NOT NULL,
	`road_address_1`	VARCHAR(255)	NULL,
	`road_address_2`	VARCHAR(255)	NULL,
	`jibun_address`	VARCHAR(255)	NULL,
	`detail_address`	VARCHAR(255)	NULL,
	`english_address`	VARCHAR(255)	NULL,
	`zip_code`	VARCHAR(20)	NULL,
	`address_name`	VARCHAR(30)	NULL
);

CREATE TABLE `report` (
	`report_id`	VARCHAR(255)	NOT NULL,
	`user_id`	VARCHAR(255)	NOT NULL,
	`target_type`	ENUM('review', 'comment')	NOT NULL	DEFAULT 'review',
	`target_id`	VARCHAR(255)	NOT NULL,
	`reason`	TEXT	NOT NULL,
	`status`	ENUM('pending', 'approved', 'rejected')	NOT NULL	DEFAULT 'pending',
	`approved_at`	DATETIME	NULL,
	`approved_by`	VARCHAR(255)	NULL,
	`is_deleted`	TINYINT(1)	NULL,
	`created_at`	DATETIME	NOT NULL,
	`updated_at`	DATETIME	NULL
);

CREATE TABLE `COUPON` (
	`coupon_id`	BIGINT	NOT NULL,
	`coupon_name`	VARCHAR(100)	NULL,
	`coupon_type`	ENUM('fixed', 'percentage')	NULL	DEFAULT 'fixed',
	`discount_value`	DECIMAL(10,2)	NULL,
	`min_order_amount`	DECIMAL(10,2)	NULL,
	`max_discount_amount`	DECIMAL(10,2)	NULL,
	`available_period`	INT	NULL,
	`total_cnt`	INT	NULL,
	`duplicate_use`	Char(1)	NULL,
	`coupon_status`	ENUM('active', 'inactive', 'expired')	NULL	DEFAULT 'active',
	`description`	TEXT	NULL,
	`start_date`	DATETIME	NULL,
	`end_date`	DATETIME	NULL,
	`created_at`	DATETIME	NULL,
	`created_by`	VARCHAR(255)	NULL
);

CREATE TABLE `handover` (
	`handover_id`	VARCHAR(50)	NOT NULL,
	`scheduled_at`	DATETIME	NULL,
	`completed_at`	DATETIME	NULL,
	`notes`	TEXT	NULL,
	`created_at`	DATETIME	NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(20)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(20)	NULL
);

CREATE TABLE `PRODUCT_OPTION_PRICE` (
	`product_variant_id`	BIGINT	NOT NULL,
	`original_price`	DECEMAL(10,2)	NULL,
	`sale_price`	DECIMAL(10, 2))	NULL,
	`discount_rate`	DECIMAL(5, 2)	NULL,
	`discount_start_date`	DATETIME	NULL,
	`discount_end_date`	DATETIME	NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL
);

CREATE TABLE `CopyOfspecial_section` (
	`special_id`	VARCHAR2(2)	NOT NULL,
	`product_id`	BIGINT	NOT NULL,
	`special_id2`	VARCHAR2(2)	NOT NULL
);

CREATE TABLE `USER_DETAIL` (
	`user_id`	BIGINT	NOT NULL,
	`email`	VARCHAR(255)	NULL,
	`name`	VARCHAR(255)	NULL,
	`phone_number`	VARCHAR(20)	NULL,
	`birth_date`	DATE	NULL,
	`gender`	ENUM('M', 'F')	NULL,
	`job_code`	INT	NOT NULL
);

CREATE TABLE `DELIVERY_EXCEPTION` (
	`delivery_exception_id`	BIGINT	NOT NULL,
	`shipment_id`	VARCHAR(50)	NOT NULL,
	`exception_type_code`	INT	NOT NULL,
	`occurred_at`	DATETIME	NULL,
	`customer_claim_desc`	TEXT	NULL,
	`evidence_url`	VARCHAR(500)	NULL,
	`courier_claim_desc`	TEXT	NULL,
	`courier_evidence_url`	VARCHAR(500)	NULL,
	`customer_compensation`	VARCHAR(200)	NULL,
	`internal_memo`	TEXT	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`resolved_at`	DATETIME	NULL,
	`user_id`	BIGINT	NOT NULL
);

CREATE TABLE `PRODUCT_SNAPSHOT` (
	`product_snapshot_id`	BIGINT	NOT NULL,
	`product_id`	BIGINT	NULL	DEFAULT NULL,
	`title`	VARCHAR(200)	NOT NULL,
	`price`	DECIMAL(10,2)	NOT NULL,
	`discount_price`	DECIMAL(10,2)	NULL,
	`sku`	VARCHAR(50)	NULL,
	`summary`	VARCHAR(500)	NULL,
	`description`	TEXT	NULL,
	`thumbnail`	VARCHAR(255)	NULL,
	`weight`	DECIMAL(5,2)	NULL,
	`dimensions`	VARCHAR(50)	NULL,
	`special`	VARCHAR(100)	NULL,
	`tags`	VARCHAR(255)	NULL,
	`seasons`	BIT(4)	NOT NULL	DEFAULT '0000',
	`is_featured`	BIT(1)	NOT NULL	DEFAULT '0',
	`average_rating`	DECIMAL(3,1)	NULL,
	`sales_count`	INT	NULL,
	`view_count`	INT	NULL,
	`stock_quantity`	INT	NULL,
	`availability_date`	DATETIME	NULL,
	`enabled`	BIT(1)	NOT NULL	DEFAULT '1',
	`created_at`	DATETIME	NOT NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL,
	`is_deleted`	DATETIME	NULL,
	`hex_code`	VARCHAR(7)	NULL,
	`color_name`	VARCHAR(50)	NULL,
	`size`	VARCHAR(50)	NULL,
	`fabric_info`	TEXT	NULL,
	`care_instructions`	TEXT	NULL,
	`original_price`	TEXT	NULL,
	`extra_charge`	TEXT	NULL,
	`sale_price`	TEXT	NULL,
	`discount_rate`	DECIMAL(5, 2)	NULL
);

CREATE TABLE `Exchange` (
	`exchange_id`	BIGINT	NOT NULL,
	`return_id`	BIGINT	NOT NULL,
	`original_order_id`	BIGINT	NOT NULL,
	`exchange_order_id`	BIGINT	NULL,
	`delivery_exception_id`	BIGINT	NOT NULL,
	`Field`	varchar(200)	NULL,
	`created_at`	TIMESTAMP	NULL,
	`completed_at`	TIMESTAMP	NULL
);

CREATE TABLE `role` (
	`role_id`	UUD	NOT NULL,
	`name`	VARCHAR	NULL,
	`is_active`	DATETIME	NULL,
	`Field`	VARCHAR(255)	NULL
);

CREATE TABLE `Cart_Item` (
	`cart_item_id`	INT	NOT NULL,
	`cart_id`	INT	NOT NULL,
	`product_variant_id`	BIGINT	NULL,
	`quantity`	INT	NOT NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `pay_status_code` (
	`pay_status_id`	BIGINT	NOT NULL,
	`pay_status_name`	VARCHAR(50)	NULL
);

CREATE TABLE `Refund` (
	`refund_id`	BIGINT	NOT NULL,
	`payment_id`	BIGINT	NOT NULL,
	`delivery_exception_id`	BIGINT	NOT NULL,
	`bank_id`	BIGINT	NOT NULL,
	`return_id`	BIGINT	NOT NULL,
	`refund_type`	INT	NULL	DEFAULT 'full',
	`refund_amount`	DECIMAL(12,2)	NULL,
	`refund_method_code`	INT	NULL,
	`refund_account`	VARCHAR(100)	NULL,
	`Field`	varchar(200)	NULL,
	`created_at`	TIMESTAMP	NULL,
	`completed_at`	TIMESTAMP	NULL
);

CREATE TABLE `WISH_LIST` (
	`wish_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`product_id`	BIGINT	NOT NULL,
	`added_at`	DATETIME	NULL
);

CREATE TABLE `Size` (
	`size_id`	BIGINT	NOT NULL,
	`name`	VARCHAR(20)	NULL,
	`is_active`	TINYINT(1)	NULL
);

CREATE TABLE `product_variant_COLOR` (
	`color_id`	BIGINT	NOT NULL,
	`name`	VARCHAR(50)	NOT NULL,
	`hex_code`	VARCHAR(7)	NOT NULL,
	`is_active`	TINYINT(1)	NULL
);

CREATE TABLE `global_code` (
	`code`	INT	NOT NULL,
	`code_group_id`	VARCHAR	NULL,
	`code_id`	INT	NULL	COMMENT 'fffff

J123 (Job), C121(옷 카테고리) 이런식으로 string은 별로일까요',
	`code_name`	VARCHAR	NULL,
	`설명`	VARCHAR2(255)	NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL
);

CREATE TABLE `CopyOfORDER_HISTORY` (
	`history_id`	BIGINT	NOT NULL,
	`status`	VARCHAR(50)	NULL,
	`comment`	TEXT	NULL,
	`created_at`	TIMESTAMP	NULL,
	`created_by`	VARCHAR(255)	NULL,
	`payment_id`	BIGINT	NOT NULL,
	`id2`	BIGINT	NOT NULL
);

CREATE TABLE `mileage_code` (
	`reason_code`	VARCHAR(255)	NOT NULL,
	`description`	VARCHAR(100)	NULL,
	`amount`	DECIMAL(10,2)	NULL,
	`modify_type`	ENUM('earn', 'use')	NULL,
	`is_active`	TINYINT(1)	NULL,
	`exp_day`	DATETIME	NULL
);

CREATE TABLE `Pay_type_code` (
	`pay_type_id`	BIGINT	NOT NULL,
	`pay_type`	VARCHAR(50)	NULL,
	`cash_code`	VARCHAR(50)	NULL
);

CREATE TABLE `pg_code` (
	`pg_id`	BIGINT	NOT NULL,
	`pg_code`	UUID	NULL,
	`pg_name`	VARCHAR(20)	NULL
);

CREATE TABLE `notice` (
	`notice_id`	INT(10)	NOT NULL,
	`user_id`	BIGINT	NULL,
	`title`	VARCHAR(200)	NOT NULL,
	`content`	TEXT	NOT NULL,
	`is_active`	TINYINT(1)	NULL,
	`is_pinned`	TINYINT(1)	NULL,
	`view_count`	INT(10)	NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL
);

CREATE TABLE `product_variant_image` (
	`image_id`	BIGINT	NOT NULL,
	`variant_id`	BIGINT	NOT NULL,
	`url`	VARCHAR(255)	NOT NULL,
	`format`	ENUM('jpg', 'png', 'webp')	NOT NULL	DEFAULT 'jpg',
	`render_priority`	INT	NULL,
	`created_at`	DATETIME	NOT NULL
);

CREATE TABLE `terms` (
	`terms_id`	BIGINT	NOT NULL,
	`title`	VARCHAR(200)	NULL,
	`code`	VARCHAR(50)	NULL,
	`content`	TEXT	NULL,
	`version`	VARCHAR(20)	NULL,
	`is_required`	TINYINT(1)	NULL,
	`is_active`	TINYINT(1)	NULL,
	`created_at`	DATETIME	NULL,
	`effective_from`	DATETIME	NULL,
	`effective_to`	DATETIME	NULL	DEFAULT NULL
);

CREATE TABLE `mileage` (
	`mileage_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`total_earned`	DECIMAL(10,2)	NULL,
	`total_used`	DECIMAL(10,2)	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `lv3` (
	`lv3_id`	varchar2(2)	NOT NULL,
	`lv2_id`	varchar2(2)	NOT NULL,
	`name`	varchar2(100)	NULL,
	`sort_order`	int	NULL,
	`is_active`	char(1)	NULL
);

CREATE TABLE `Shipment` (
	`shipment_id`	VARCHAR(50)	NOT NULL,
	`order_id`	BIGINT	NULL,
	`handover_id`	VARCHAR(50)	NOT NULL,
	`delivery_company_id`	VARCHAR(50)	NULL,
	`shipment_status`	INT	NOT NULL,
	`shipment_type_code`	INT	NULL	DEFAULT 'delivery',
	`shipment_option_code`	INT	NULL	DEFAULT 'standard',
	`fee_bearer`	VARCHAR(100)	NULL,
	`amount`	VARCHAR(255)	NULL,
	`tracking_number`	VARCHAR(100)	NULL,
	`receiver_name`	VARCHAR(100)	NULL,
	`receiver_phone`	VARCHAR(20)	NULL,
	`receiver_address`	TEXT	NULL,
	`road_name_address1`	VARCHAR(100)	NULL,
	`road_name_address2`	VARCHAR(100)	NULL,
	`receiver_postal_code`	VARCHAR(10)	NULL,
	`street_number`	VARCHAR(10)	NULL,
	`english_address`	VARCHAR(500)	NULL,
	`receive_method`	VARCHAR(500)	NULL	DEFAULT 'direct',
	`delivery_memo`	TEXT	NULL,
	`shipped_at`	TIMESTAMP	NULL,
	`delivered_at`	TIMESTAMP	NULL,
	`created_at`	TIMESTAMP	NULL,
	`updated_at`	TIMESTAMP	NULL	DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `LOGIN_HISTORY` (
	`id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`ip`	VARCHAR(45)	NULL,
	`browser`	VARCHAR(255)	NULL,
	`nation`	VARCHAR(100)	NULL,
	`region`	VARCHAR(100)	NULL,
	`attempt_result`	TINYINT(1)	NULL,
	`consecutive_failed_login_attempt`	INT	NULL,
	`created_at`	DATETIME	NOT NULL,
	`updated_at`	DATETIME	NULL
);

CREATE TABLE `refund_account` (
	`user_id`	BIGINT	NOT NULL,
	`account_name`	VARCHAR(255)	NULL,
	`account_num`	VARCHAR(255)	NULL,
	`bank_id`	BIGINT	NOT NULL
);

CREATE TABLE `ORDER_ITEM` (
	`order_item_id`	BIGINT	NOT NULL,
	`order_id`	BIGINT	NOT NULL,
	`product_snapshot_id`	BIGINT	NOT NULL,
	`created_at`	DATETIME	NULL
);

CREATE TABLE `authenticate` (
	`permission_id`	UUID	NOT NULL,
	`name`	VARCHAR	NOT NULL	COMMENT 'UNIQUE

user:read',
	`version`	VARCHAR	NULL,
	`created_at`	DATETIME	NULL
);

CREATE TABLE `lv2` (
	`lv2_id`	varchar2(2)	NOT NULL,
	`lv1_id`	varchar2(2)	NOT NULL,
	`name`	varchar2(100)	NULL,
	`sort_order`	int	NULL,
	`is_active`	char(1)	NULL
);

CREATE TABLE `mileage_history` (
	`history_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`mileage_id`	BIGINT	NOT NULL,
	`reason_code`	VARCHAR(255)	NOT NULL,
	`related_order_id`	BIGINT	NULL,
	`review_id`	BIGINT	NULL,
	`balance_after`	DECIMAL(10,2)	NULL,
	`status`	ENUM('pending','approve', 'reject','cancel','refund','complete')	NULL,
	`reason_desc`	VARCHAR(100)	NULL,
	`created_at`	DATETIME	NOT NULL,
	`updated_at`	DATETIME	NULL,
	`expire_date`	DATETIME	NULL
);

CREATE TABLE `Cart` (
	`cart_id`	INT(10)	NOT NULL,
	`user_id`	BIGINT	NOT NULL,
	`created_at`	DATETIME	NULL,
	`updated_at`	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	`deleted_at`	DATETIME	NULL
);

CREATE TABLE `product_description_image` (
	`image_id`	BIGINT	NOT NULL,
	`product_id`	BIGINT	NOT NULL,
	`show_device`	VARCHAR2(100)	NULL,
	`url`	VARCHAR(255)	NOT NULL,
	`format`	ENUM('jpg', 'png', 'webp')	NOT NULL	DEFAULT 'jpg',
	`created_at`	DATETIME	NOT NULL,
	`render_priority`	VARCHAR(255)	NULL
);

ALTER TABLE `Shipment_related_code` ADD CONSTRAINT `PK_SHIPMENT_RELATED_CODE` PRIMARY KEY (
	`shipment_status`
);

ALTER TABLE `PRODUCT_STOCK` ADD CONSTRAINT `PK_PRODUCT_STOCK` PRIMARY KEY (
	`product_variant_stock_id`
);

ALTER TABLE `ORDERS` ADD CONSTRAINT `PK_ORDERS` PRIMARY KEY (
	`order_id`
);

ALTER TABLE `Inquiry` ADD CONSTRAINT `PK_INQUIRY` PRIMARY KEY (
	`inquiry_id`
);

ALTER TABLE `Return` ADD CONSTRAINT `PK_RETURN` PRIMARY KEY (
	`return_id`
);

ALTER TABLE `review_like` ADD CONSTRAINT `PK_REVIEW_LIKE` PRIMARY KEY (
	`like_id`
);

ALTER TABLE `USERS` ADD CONSTRAINT `PK_USERS` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `ADMIN_DETAIL` ADD CONSTRAINT `PK_ADMIN_DETAIL` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `special_section` ADD CONSTRAINT `PK_SPECIAL_SECTION` PRIMARY KEY (
	`special_id`
);

ALTER TABLE `role-permission` ADD CONSTRAINT `PK_ROLE-PERMISSION` PRIMARY KEY (
	`id`
);

ALTER TABLE `Order_state_code` ADD CONSTRAINT `PK_ORDER_STATE_CODE` PRIMARY KEY (
	`order_status_code_id[`
);

ALTER TABLE `user_terms_agreement` ADD CONSTRAINT `PK_USER_TERMS_AGREEMENT` PRIMARY KEY (
	`agreement_id`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`product_id`
);

ALTER TABLE `bank` ADD CONSTRAINT `PK_BANK` PRIMARY KEY (
	`bank_id`
);

ALTER TABLE `product_variant` ADD CONSTRAINT `PK_PRODUCT_VARIANT` PRIMARY KEY (
	`product_variant_id`
);

ALTER TABLE `ORDER_HISTORY` ADD CONSTRAINT `PK_ORDER_HISTORY` PRIMARY KEY (
	`history_id`
);

ALTER TABLE `USER_COUPON` ADD CONSTRAINT `PK_USER_COUPON` PRIMARY KEY (
	`user_coupon_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_id`
);

ALTER TABLE `lv1` ADD CONSTRAINT `PK_LV1` PRIMARY KEY (
	`lv1_id`
);

ALTER TABLE `Delivery_Company_API` ADD CONSTRAINT `PK_DELIVERY_COMPANY_API` PRIMARY KEY (
	`delivery_company_id`
);

ALTER TABLE `review_comment` ADD CONSTRAINT `PK_REVIEW_COMMENT` PRIMARY KEY (
	`comment_id`
);

ALTER TABLE `PAYMENT` ADD CONSTRAINT `PK_PAYMENT` PRIMARY KEY (
	`payment_id`
);

ALTER TABLE `inquiry_answer` ADD CONSTRAINT `PK_INQUIRY_ANSWER` PRIMARY KEY (
	`inquiry_answer_id`
);

ALTER TABLE `default_user_address` ADD CONSTRAINT `PK_DEFAULT_USER_ADDRESS` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `report` ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
	`report_id`
);

ALTER TABLE `COUPON` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`coupon_id`
);

ALTER TABLE `handover` ADD CONSTRAINT `PK_HANDOVER` PRIMARY KEY (
	`handover_id`
);

ALTER TABLE `PRODUCT_OPTION_PRICE` ADD CONSTRAINT `PK_PRODUCT_OPTION_PRICE` PRIMARY KEY (
	`product_variant_id`
);

ALTER TABLE `CopyOfspecial_section` ADD CONSTRAINT `PK_COPYOFSPECIAL_SECTION` PRIMARY KEY (
	`special_id`
);

ALTER TABLE `USER_DETAIL` ADD CONSTRAINT `PK_USER_DETAIL` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `DELIVERY_EXCEPTION` ADD CONSTRAINT `PK_DELIVERY_EXCEPTION` PRIMARY KEY (
	`delivery_exception_id`
);

ALTER TABLE `PRODUCT_SNAPSHOT` ADD CONSTRAINT `PK_PRODUCT_SNAPSHOT` PRIMARY KEY (
	`product_snapshot_id`
);

ALTER TABLE `Exchange` ADD CONSTRAINT `PK_EXCHANGE` PRIMARY KEY (
	`exchange_id`
);

ALTER TABLE `role` ADD CONSTRAINT `PK_ROLE` PRIMARY KEY (
	`role_id`
);

ALTER TABLE `Cart_Item` ADD CONSTRAINT `PK_CART_ITEM` PRIMARY KEY (
	`cart_item_id`
);

ALTER TABLE `pay_status_code` ADD CONSTRAINT `PK_PAY_STATUS_CODE` PRIMARY KEY (
	`pay_status_id`
);

ALTER TABLE `Refund` ADD CONSTRAINT `PK_REFUND` PRIMARY KEY (
	`refund_id`
);

ALTER TABLE `WISH_LIST` ADD CONSTRAINT `PK_WISH_LIST` PRIMARY KEY (
	`wish_id`
);

ALTER TABLE `Size` ADD CONSTRAINT `PK_SIZE` PRIMARY KEY (
	`size_id`
);

ALTER TABLE `product_variant_COLOR` ADD CONSTRAINT `PK_PRODUCT_VARIANT_COLOR` PRIMARY KEY (
	`color_id`
);

ALTER TABLE `global_code` ADD CONSTRAINT `PK_GLOBAL_CODE` PRIMARY KEY (
	`code`
);

ALTER TABLE `CopyOfORDER_HISTORY` ADD CONSTRAINT `PK_COPYOFORDER_HISTORY` PRIMARY KEY (
	`history_id`
);

ALTER TABLE `mileage_code` ADD CONSTRAINT `PK_MILEAGE_CODE` PRIMARY KEY (
	`reason_code`
);

ALTER TABLE `Pay_type_code` ADD CONSTRAINT `PK_PAY_TYPE_CODE` PRIMARY KEY (
	`pay_type_id`
);

ALTER TABLE `pg_code` ADD CONSTRAINT `PK_PG_CODE` PRIMARY KEY (
	`pg_id`
);

ALTER TABLE `notice` ADD CONSTRAINT `PK_NOTICE` PRIMARY KEY (
	`notice_id`
);

ALTER TABLE `product_variant_image` ADD CONSTRAINT `PK_PRODUCT_VARIANT_IMAGE` PRIMARY KEY (
	`image_id`
);

ALTER TABLE `terms` ADD CONSTRAINT `PK_TERMS` PRIMARY KEY (
	`terms_id`
);

ALTER TABLE `mileage` ADD CONSTRAINT `PK_MILEAGE` PRIMARY KEY (
	`mileage_id`
);

ALTER TABLE `lv3` ADD CONSTRAINT `PK_LV3` PRIMARY KEY (
	`lv3_id`
);

ALTER TABLE `Shipment` ADD CONSTRAINT `PK_SHIPMENT` PRIMARY KEY (
	`shipment_id`
);

ALTER TABLE `LOGIN_HISTORY` ADD CONSTRAINT `PK_LOGIN_HISTORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `refund_account` ADD CONSTRAINT `PK_REFUND_ACCOUNT` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `ORDER_ITEM` ADD CONSTRAINT `PK_ORDER_ITEM` PRIMARY KEY (
	`order_item_id`
);

ALTER TABLE `authenticate` ADD CONSTRAINT `PK_AUTHENTICATE` PRIMARY KEY (
	`permission_id`
);

ALTER TABLE `lv2` ADD CONSTRAINT `PK_LV2` PRIMARY KEY (
	`lv2_id`
);

ALTER TABLE `mileage_history` ADD CONSTRAINT `PK_MILEAGE_HISTORY` PRIMARY KEY (
	`history_id`
);

ALTER TABLE `Cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cart_id`
);

ALTER TABLE `product_description_image` ADD CONSTRAINT `PK_PRODUCT_DESCRIPTION_IMAGE` PRIMARY KEY (
	`image_id`
);

ALTER TABLE `ORDERS` ADD CONSTRAINT `FK_USERS_TO_ORDERS_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `ORDERS` ADD CONSTRAINT `FK_USER_COUPON_TO_ORDERS_1` FOREIGN KEY (
	`user_coupon_id`
)
REFERENCES `USER_COUPON` (
	`user_coupon_id`
);

ALTER TABLE `ORDERS` ADD CONSTRAINT `FK_Order_state_code_TO_ORDERS_1` FOREIGN KEY (
	`id2`
)
REFERENCES `Order_state_code` (
	`order_status_code_id[`
);

ALTER TABLE `Inquiry` ADD CONSTRAINT `FK_USERS_TO_Inquiry_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `Inquiry` ADD CONSTRAINT `FK_product_TO_Inquiry_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

ALTER TABLE `Return` ADD CONSTRAINT `FK_ORDERS_TO_Return_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `Return` ADD CONSTRAINT `FK_ADMIN_DETAIL_TO_Return_1` FOREIGN KEY (
	`approve_admin_id`
)
REFERENCES `ADMIN_DETAIL` (
	`user_id`
);

ALTER TABLE `Return` ADD CONSTRAINT `FK_Shipment_TO_Return_1` FOREIGN KEY (
	`shipment_id`
)
REFERENCES `Shipment` (
	`shipment_id`
);

ALTER TABLE `review_like` ADD CONSTRAINT `FK_review_TO_review_like_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`review_id`
);

ALTER TABLE `review_like` ADD CONSTRAINT `FK_USERS_TO_review_like_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `USERS` ADD CONSTRAINT `FK_role_TO_USERS_1` FOREIGN KEY (
	`role_id`
)
REFERENCES `role` (
	`role_id`
);

ALTER TABLE `ADMIN_DETAIL` ADD CONSTRAINT `FK_USERS_TO_ADMIN_DETAIL_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `role-permission` ADD CONSTRAINT `FK_role_TO_role-permission_1` FOREIGN KEY (
	`role_id`
)
REFERENCES `role` (
	`role_id`
);

ALTER TABLE `role-permission` ADD CONSTRAINT `FK_authenticate_TO_role-permission_1` FOREIGN KEY (
	`permission_id`
)
REFERENCES `authenticate` (
	`permission_id`
);

ALTER TABLE `user_terms_agreement` ADD CONSTRAINT `FK_USERS_TO_user_terms_agreement_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `user_terms_agreement` ADD CONSTRAINT `FK_terms_TO_user_terms_agreement_1` FOREIGN KEY (
	`terms_id`
)
REFERENCES `terms` (
	`terms_id`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_lv3_TO_product_1` FOREIGN KEY (
	`category_lv3_id`
)
REFERENCES `lv3` (
	`lv3_id`
);

ALTER TABLE `product_variant` ADD CONSTRAINT `FK_product_TO_product_variant_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

ALTER TABLE `product_variant` ADD CONSTRAINT `FK_PRODUCT_STOCK_TO_product_variant_1` FOREIGN KEY (
	`product_variant_stock_id`
)
REFERENCES `PRODUCT_STOCK` (
	`product_variant_stock_id`
);

ALTER TABLE `product_variant` ADD CONSTRAINT `FK_Size_TO_product_variant_1` FOREIGN KEY (
	`size_id`
)
REFERENCES `Size` (
	`size_id`
);

ALTER TABLE `product_variant` ADD CONSTRAINT `FK_product_variant_COLOR_TO_product_variant_1` FOREIGN KEY (
	`color_id`
)
REFERENCES `product_variant_COLOR` (
	`color_id`
);

ALTER TABLE `ORDER_HISTORY` ADD CONSTRAINT `FK_ORDERS_TO_ORDER_HISTORY_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `ORDER_HISTORY` ADD CONSTRAINT `FK_ORDER_ITEM_TO_ORDER_HISTORY_1` FOREIGN KEY (
	`order_item_id`
)
REFERENCES `ORDER_ITEM` (
	`order_item_id`
);

ALTER TABLE `ORDER_HISTORY` ADD CONSTRAINT `FK_Order_state_code_TO_ORDER_HISTORY_1` FOREIGN KEY (
	`id2`
)
REFERENCES `Order_state_code` (
	`order_status_code_id[`
);

ALTER TABLE `USER_COUPON` ADD CONSTRAINT `FK_USERS_TO_USER_COUPON_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `USER_COUPON` ADD CONSTRAINT `FK_COUPON_TO_USER_COUPON_1` FOREIGN KEY (
	`coupon_id`
)
REFERENCES `COUPON` (
	`coupon_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_USERS_TO_review_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_product_TO_review_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

ALTER TABLE `review_comment` ADD CONSTRAINT `FK_review_TO_review_comment_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`review_id`
);

ALTER TABLE `review_comment` ADD CONSTRAINT `FK_USERS_TO_review_comment_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `PAYMENT` ADD CONSTRAINT `FK_ORDERS_TO_PAYMENT_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `PAYMENT` ADD CONSTRAINT `FK_USERS_TO_PAYMENT_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `PAYMENT` ADD CONSTRAINT `FK_pg_code_TO_PAYMENT_1` FOREIGN KEY (
	`pg_id`
)
REFERENCES `pg_code` (
	`pg_id`
);

ALTER TABLE `PAYMENT` ADD CONSTRAINT `FK_pay_status_code_TO_PAYMENT_1` FOREIGN KEY (
	`pay_status_id`
)
REFERENCES `pay_status_code` (
	`pay_status_id`
);

ALTER TABLE `PAYMENT` ADD CONSTRAINT `FK_Pay_type_code_TO_PAYMENT_1` FOREIGN KEY (
	`pay_type_id`
)
REFERENCES `Pay_type_code` (
	`pay_type_id`
);

ALTER TABLE `inquiry_answer` ADD CONSTRAINT `FK_Inquiry_TO_inquiry_answer_1` FOREIGN KEY (
	`inquiry_id`
)
REFERENCES `Inquiry` (
	`inquiry_id`
);

ALTER TABLE `inquiry_answer` ADD CONSTRAINT `FK_ADMIN_DETAIL_TO_inquiry_answer_1` FOREIGN KEY (
	`admin_id`
)
REFERENCES `ADMIN_DETAIL` (
	`user_id`
);

ALTER TABLE `default_user_address` ADD CONSTRAINT `FK_USER_DETAIL_TO_default_user_address_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USER_DETAIL` (
	`user_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_USERS_TO_report_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `PRODUCT_OPTION_PRICE` ADD CONSTRAINT `FK_product_variant_TO_PRODUCT_OPTION_PRICE_1` FOREIGN KEY (
	`product_variant_id`
)
REFERENCES `product_variant` (
	`product_variant_id`
);

ALTER TABLE `CopyOfspecial_section` ADD CONSTRAINT `FK_product_TO_CopyOfspecial_section_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

ALTER TABLE `CopyOfspecial_section` ADD CONSTRAINT `FK_special_section_TO_CopyOfspecial_section_1` FOREIGN KEY (
	`special_id2`
)
REFERENCES `special_section` (
	`special_id`
);

ALTER TABLE `USER_DETAIL` ADD CONSTRAINT `FK_USERS_TO_USER_DETAIL_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `USER_DETAIL` ADD CONSTRAINT `FK_global_code_TO_USER_DETAIL_1` FOREIGN KEY (
	`job_code`
)
REFERENCES `global_code` (
	`code`
);

ALTER TABLE `DELIVERY_EXCEPTION` ADD CONSTRAINT `FK_Shipment_TO_DELIVERY_EXCEPTION_1` FOREIGN KEY (
	`shipment_id`
)
REFERENCES `Shipment` (
	`shipment_id`
);

ALTER TABLE `DELIVERY_EXCEPTION` ADD CONSTRAINT `FK_ADMIN_DETAIL_TO_DELIVERY_EXCEPTION_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `ADMIN_DETAIL` (
	`user_id`
);

ALTER TABLE `PRODUCT_SNAPSHOT` ADD CONSTRAINT `FK_product_TO_PRODUCT_SNAPSHOT_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

ALTER TABLE `Exchange` ADD CONSTRAINT `FK_Return_TO_Exchange_1` FOREIGN KEY (
	`return_id`
)
REFERENCES `Return` (
	`return_id`
);

ALTER TABLE `Exchange` ADD CONSTRAINT `FK_ORDERS_TO_Exchange_1` FOREIGN KEY (
	`original_order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `Exchange` ADD CONSTRAINT `FK_ORDERS_TO_Exchange_2` FOREIGN KEY (
	`exchange_order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `Exchange` ADD CONSTRAINT `FK_DELIVERY_EXCEPTION_TO_Exchange_1` FOREIGN KEY (
	`delivery_exception_id`
)
REFERENCES `DELIVERY_EXCEPTION` (
	`delivery_exception_id`
);

ALTER TABLE `Cart_Item` ADD CONSTRAINT `FK_Cart_TO_Cart_Item_1` FOREIGN KEY (
	`cart_id`
)
REFERENCES `Cart` (
	`cart_id`
);

ALTER TABLE `Cart_Item` ADD CONSTRAINT `FK_product_variant_TO_Cart_Item_1` FOREIGN KEY (
	`product_variant_id`
)
REFERENCES `product_variant` (
	`product_variant_id`
);

ALTER TABLE `Refund` ADD CONSTRAINT `FK_PAYMENT_TO_Refund_1` FOREIGN KEY (
	`payment_id`
)
REFERENCES `PAYMENT` (
	`payment_id`
);

ALTER TABLE `Refund` ADD CONSTRAINT `FK_DELIVERY_EXCEPTION_TO_Refund_1` FOREIGN KEY (
	`delivery_exception_id`
)
REFERENCES `DELIVERY_EXCEPTION` (
	`delivery_exception_id`
);

ALTER TABLE `Refund` ADD CONSTRAINT `FK_bank_TO_Refund_1` FOREIGN KEY (
	`bank_id`
)
REFERENCES `bank` (
	`bank_id`
);

ALTER TABLE `Refund` ADD CONSTRAINT `FK_Return_TO_Refund_1` FOREIGN KEY (
	`return_id`
)
REFERENCES `Return` (
	`return_id`
);

ALTER TABLE `WISH_LIST` ADD CONSTRAINT `FK_USERS_TO_WISH_LIST_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `WISH_LIST` ADD CONSTRAINT `FK_product_TO_WISH_LIST_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

ALTER TABLE `CopyOfORDER_HISTORY` ADD CONSTRAINT `FK_PAYMENT_TO_CopyOfORDER_HISTORY_1` FOREIGN KEY (
	`payment_id`
)
REFERENCES `PAYMENT` (
	`payment_id`
);

ALTER TABLE `CopyOfORDER_HISTORY` ADD CONSTRAINT `FK_pay_status_code_TO_CopyOfORDER_HISTORY_1` FOREIGN KEY (
	`id2`
)
REFERENCES `pay_status_code` (
	`pay_status_id`
);

ALTER TABLE `notice` ADD CONSTRAINT `FK_ADMIN_DETAIL_TO_notice_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `ADMIN_DETAIL` (
	`user_id`
);

ALTER TABLE `product_variant_image` ADD CONSTRAINT `FK_product_variant_TO_product_variant_image_1` FOREIGN KEY (
	`variant_id`
)
REFERENCES `product_variant` (
	`product_variant_id`
);

ALTER TABLE `mileage` ADD CONSTRAINT `FK_USERS_TO_mileage_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `lv3` ADD CONSTRAINT `FK_lv2_TO_lv3_1` FOREIGN KEY (
	`lv2_id`
)
REFERENCES `lv2` (
	`lv2_id`
);

ALTER TABLE `Shipment` ADD CONSTRAINT `FK_ORDERS_TO_Shipment_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `Shipment` ADD CONSTRAINT `FK_handover_TO_Shipment_1` FOREIGN KEY (
	`handover_id`
)
REFERENCES `handover` (
	`handover_id`
);

ALTER TABLE `Shipment` ADD CONSTRAINT `FK_Delivery_Company_API_TO_Shipment_1` FOREIGN KEY (
	`delivery_company_id`
)
REFERENCES `Delivery_Company_API` (
	`delivery_company_id`
);

ALTER TABLE `Shipment` ADD CONSTRAINT `FK_Shipment_related_code_TO_Shipment_1` FOREIGN KEY (
	`shipment_status`
)
REFERENCES `Shipment_related_code` (
	`shipment_status`
);

ALTER TABLE `LOGIN_HISTORY` ADD CONSTRAINT `FK_USERS_TO_LOGIN_HISTORY_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `refund_account` ADD CONSTRAINT `FK_USER_DETAIL_TO_refund_account_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USER_DETAIL` (
	`user_id`
);

ALTER TABLE `refund_account` ADD CONSTRAINT `FK_bank_TO_refund_account_1` FOREIGN KEY (
	`bank_id`
)
REFERENCES `bank` (
	`bank_id`
);

ALTER TABLE `ORDER_ITEM` ADD CONSTRAINT `FK_ORDERS_TO_ORDER_ITEM_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `ORDER_ITEM` ADD CONSTRAINT `FK_PRODUCT_SNAPSHOT_TO_ORDER_ITEM_1` FOREIGN KEY (
	`product_snapshot_id`
)
REFERENCES `PRODUCT_SNAPSHOT` (
	`product_snapshot_id`
);

ALTER TABLE `lv2` ADD CONSTRAINT `FK_lv1_TO_lv2_1` FOREIGN KEY (
	`lv1_id`
)
REFERENCES `lv1` (
	`lv1_id`
);

ALTER TABLE `mileage_history` ADD CONSTRAINT `FK_USERS_TO_mileage_history_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `mileage_history` ADD CONSTRAINT `FK_mileage_TO_mileage_history_1` FOREIGN KEY (
	`mileage_id`
)
REFERENCES `mileage` (
	`mileage_id`
);

ALTER TABLE `mileage_history` ADD CONSTRAINT `FK_mileage_code_TO_mileage_history_1` FOREIGN KEY (
	`reason_code`
)
REFERENCES `mileage_code` (
	`reason_code`
);

ALTER TABLE `mileage_history` ADD CONSTRAINT `FK_ORDERS_TO_mileage_history_1` FOREIGN KEY (
	`related_order_id`
)
REFERENCES `ORDERS` (
	`order_id`
);

ALTER TABLE `mileage_history` ADD CONSTRAINT `FK_review_TO_mileage_history_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`review_id`
);

ALTER TABLE `Cart` ADD CONSTRAINT `FK_USERS_TO_Cart_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`user_id`
);

ALTER TABLE `product_description_image` ADD CONSTRAINT `FK_product_TO_product_description_image_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

