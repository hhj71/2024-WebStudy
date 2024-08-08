package com.sist.dao;

import lombok.Data;

/*
 * 
 * MNO	NUMBER	No
TITLE	VARCHAR2(2000 BYTE)	No
SINGER	VARCHAR2(2000 BYTE)	No
ALBUM	VARCHAR2(2000 BYTE)	Yes
POSTER	VARCHAR2(300 BYTE)	No
STATE	CHAR(12 BYTE)	Yes
IDCREMENT	NUMBER	Yes
 */
@Data
public class MusicVO {
		private int mno, idcrement;
		private String title, singer, album, poster, state; 
}
