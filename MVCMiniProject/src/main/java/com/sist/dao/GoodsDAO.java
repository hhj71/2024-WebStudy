package com.sist.dao;
import java.sql.*;
import java.util.*;
import javax.sql.*;

import com.sist.vo.*;

import javax.naming.*;
public class GoodsDAO {
    private Connection conn;
    private PreparedStatement ps;
    private static GoodsDAO dao;
    private DbcpConnection dbConn= new DbcpConnection();
    
    public static GoodsDAO newInstance()
    {
    	if(dao==null)
    		dao=new GoodsDAO();
    	
    	return dao;
    }
    
    public List<GoodsVO> goodsTop12()
	   {
		   List<GoodsVO> list=new ArrayList<GoodsVO>();
		   try
		   {
			   conn=dbConn.getConnection();
			   String sql="SELECT no,goods_name,goods_poster,rownum "
					     +"FROM (SELECT no,goods_name,goods_poster "
					     +"FROM goods_all ORDER BY hit DESC) "
					     +"WHERE rownum <= 12";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   GoodsVO vo=new GoodsVO();
				   vo.setNo(rs.getInt(1));
				   vo.setName(rs.getString(2));
				   vo.setPoster(rs.getString(3).replace("https", "http"));
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbConn.disConnection(conn, ps);
		   }
		   return list;
	   }
    
    // goods와 관련된 기능 
    public List<GoodsVO> goodsListData(int page)
    {
    	List<GoodsVO> list=new ArrayList<GoodsVO>();
    	try
    	{
    		// 주소 얻기
    		conn=dbConn.getConnection();
    		String sql="SELECT no,goods_name,goods_poster,goods_price, num "
    				  +"FROM (SELECT no,goods_name,goods_poster,goods_price,rownum as num "
    				  +"FROM (SELECT /*+ INDEX_ASC(goods_all goods_no_pk)*/no,goods_name,goods_poster,goods_price "
    				  +"FROM goods_all)) "
    				  +"WHERE num BETWEEN ? AND ?";
    		ps=conn.prepareStatement(sql);
    		int rowSize=12;
    		int start=(rowSize*page)-(rowSize-1); // rownum은 1번
    		int end=rowSize*page; 
    		
    		// 1~12  , 13 ~ 24
    		ps.setInt(1, start);
    		ps.setInt(2, end);
    		
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			GoodsVO vo=new GoodsVO();
    			vo.setNo(rs.getInt(1));
    			vo.setName(rs.getString(2));
    			vo.setPoster(rs.getString(3));
    			vo.setPrice(rs.getString(4));
    			list.add(vo);
    		}
    		rs.close();
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		 dbConn.disConnection(conn, ps);
    	}
    	return list;
    }
    
    public int goodsTotalPage()
    {
    	int total=0;
    	try
    	{
    		conn=dbConn.getConnection();
    		String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		total=rs.getInt(1);
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		 dbConn.disConnection(conn, ps);
    	}
    	return total;
    }
}