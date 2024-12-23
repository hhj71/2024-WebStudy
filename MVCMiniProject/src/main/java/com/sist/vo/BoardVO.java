package com.sist.vo;
import java.util.*;
import lombok.Data;
/*
 *			1. 목록 => 페이징
 *			2.  상세보기
 *			3. CRUD => 게시판 
 *						=> 댓글
 *			4. 파일 업로드
 *			========================= 신입사원 요구사항 
 * 		MVC  / Spring
 * 		
 * 		=> JSON => Ajax / Vue / React
 * 		=> AWS : 호스팅
 */
@Data
public class BoardVO {
   private int no,hit;
   private String name,subject,content,pwd,dbday;
   private Date regdate;
   private int rownum;
   
}
