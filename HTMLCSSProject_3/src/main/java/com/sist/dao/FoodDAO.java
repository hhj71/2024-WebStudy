package com.sist.dao;
import java.util.*;
import java.sql.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	 private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	 
	 public FoodDAO()
	   {
		   try
		   {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
		   }catch(Exception ex) {}
	   }
	   public void getConnection()
	   {
		   try
		   {
			   conn=DriverManager.getConnection(URL,"hr","happy");
		   }catch(Exception ex) {}
	   }
	   public void disConnection() 
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex) {}
	   }
	   public static FoodDAO newInstance()
	   {
		   if(dao==null)
			   dao=new FoodDAO();
		   return dao;
	   }
	   
	   // 기능
	   /*
	    * 		 FNO                                       NOT NULL NUMBER
				 NAME                                      NOT NULL VARCHAR2(200)
				 TYPE                                      NOT NULL VARCHAR2(200)
				 PHONE                                              VARCHAR2(30)
				 ADDRESS                                            VARCHAR2(700)
				 SCORE                                              NUMBER(2,1)
				 THEME                                              CLOB
				 POSTER                                    NOT NULL VARCHAR2(260)
				 CONTENT                                            CLOB
	    * 
	    */
	   public void foodInsert(FoodVO vo)
	   {
		   try 
		   {
			   getConnection();
			   String sql = " INSERT INTO food_house(fno, name, type, phone, address, score, theme, poster, content ) "
					   						+"VALUES(fh_fno_seq.nextval, ?,?,?,?,?,?,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getType());
			   ps.setString(3, vo.getPhone());
			   ps.setString(4, vo.getAddress());
			   ps.setDouble(5, vo.getScore());
			   ps.setString(6, vo.getTheme());
			   ps.setString(7, "https://www.menupan.com"+vo.getPoster());
			   ps.setString(8, vo.getContent());
			   ps.executeUpdate();
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   	disConnection();
		   }
	   }
	   
}


