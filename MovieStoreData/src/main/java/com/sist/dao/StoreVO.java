package com.sist.dao;

import lombok.Data;

/*
 * 
 * NO	NUMBER	No
	NAME	VARCHAR2(200 BYTE)	No
	IMAGE	VARCHAR2(2000 BYTE)	No
	PRICE	NUMBER	Yes
	CONTENT	CLOB	Yes
 */
@Data
public class StoreVO {
		private int no;
		private String name, image, price, content;
}
