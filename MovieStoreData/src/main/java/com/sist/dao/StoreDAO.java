package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.StoreVO;

public class StoreDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static StoreDAO dao;
	 private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	 
	 public StoreDAO()
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
	   public static StoreDAO newInstance()
	   {
		   if(dao==null)
			   dao=new StoreDAO();
		   return dao;
	   }
	   public void storeInsert(StoreVO vo)
	   {
		   try 
		   {
			   getConnection();
			   String sql = " INSERT INTO Movie_Store(no, name, price, image, content) "
					   						+"VALUES(ms_no_seq.nextval, ?,?,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getPrice());
			   ps.setString(3, vo.getImage());
			   ps.setString(4, vo.getContent()); 
			   
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
