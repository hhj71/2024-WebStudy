package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	static
	{
			try
			{
				// ssf에 대한 초기화
				Reader reader = Resources.getResourceAsReader("config.xml");
				// classpath => 자동인식 => src / main / java
				// XML 파싱한 데이터를 첨부
				ssf = new SqlSessionFactoryBuilder().build(reader);
				// sql id
				
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
	}
	
	   public static List<FoodVO> foodListData(Map map)
	   {
		   		List<FoodVO> list = new ArrayList<FoodVO>();
		   		SqlSession session = null;
		   		try 
		   		{
		   						
		   			
		   			
		   			  ps = conn.prepareStatement(sql);
		   			  int rowSize=12;
		   			  int start = (rowSize*page)-(rowSize-1);
		   			  int end = rowSize*page;
		   			  
		   			  // ? 에 값을 채운다 => 실행
		   			  ps.setString(1, mode[type]);
		   			  ps.setInt(2, start);
		   			  ps.setInt(3, end);
		   			  // goodsDAO
		   			  // 전체 / 베스트 / 특가 / 신상품 => 각각 테이블이 만들어져 있다
		   			  ResultSet rs=ps.executeQuery();
		   			  while(rs.next())
		   			  {
		   				  FoodVO vo= new FoodVO();
		   				  vo.setFno(rs.getInt(1));
		   				  vo.setName(rs.getString(2));
		   				  vo.setPoster(rs.getString(3).replace("https", "http"));
		   				  list.add(vo);
		   			  }
		   			  rs.close();
		   		}catch (Exception ex)
		   		{
		   			System.out.println("===== foodListData() 오류 발생 =====");
					ex.printStackTrace();
				}
		   		finally
		   		{
		   			dbConn.disConnection(conn, ps);
		   		}
		   		return list;
	   }
	   public int foodListTotalPage(int type)
	   {
		   int total  = 0;
		   try 
		   {
			   conn= dbConn.getConnection();
			   String sql="SELECT CEIL(COUNT(*)/12.0) "
					     +"FROM food_house "
					     +"WHERE type LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, mode[type]);
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
