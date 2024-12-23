package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.sist.vo.*;

public class SeoulDAO {
		private Connection conn;
		private PreparedStatement ps;
		private static SeoulDAO dao;
		private DbcpConnection dbConn= new DbcpConnection();
		private final int ROWSIZE=20;
		
		public static SeoulDAO newInstance()
		{
			if(dao==null)
				dao = new SeoulDAO();
			 return dao;
		}
		
		 public List<LocationVO> seoulTop12()
		   {
			   List<LocationVO> list=new ArrayList<LocationVO>();
			   try
			   {
				   conn=dbConn.getConnection();
				   String sql="SELECT no,title,poster,rownum "
						     +"FROM (SELECT no,title,poster "
						     +"FROM seoul_location ORDER BY no ASC) "
						     +"WHERE rownum <= 12";
				   ps=conn.prepareStatement(sql);
				   ResultSet rs=ps.executeQuery();
				   while(rs.next())
				   {
					   LocationVO vo=new LocationVO();
					   vo.setNo(rs.getInt(1));
					   vo.setTitle(rs.getString(2));
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
		public List<LocationVO> seoulLocationListData(int page)
		{
			List<LocationVO> list = new ArrayList<LocationVO>();
			try
			{
				conn=dbConn.getConnection();
				String sql="SELECT no, title, poster, num "
									+"FROM (SELECT no, title, poster, rownum as num "
									+"FROM (SELECT no, title, poster "
									+"FROM seoul_location ORDER BY no ASC)) "
									+"WHERE num BETWEEN ? AND ?";
					ps=conn.prepareStatement(sql);
					
					int start = (ROWSIZE*page)-(ROWSIZE-1);
					int end = ROWSIZE*page;
					ps.setInt(1, start);
					ps.setInt(2, end);
					ResultSet  rs = ps.executeQuery();
					while(rs.next())
					{
						LocationVO vo = new LocationVO();
						vo.setNo(rs.getInt(1));
						vo.setTitle(rs.getString(2));
						vo.setPoster(rs.getString(3));
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
		
		public int seoulLocationTotalPage()
		{
			int total=0;
			try
			{
				  conn=dbConn.getConnection();
				String sql = "SELECT CEIL(COUNT(*)/"+ ROWSIZE+") FROM seoul_location";
				ps=conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				total = rs.getInt(1);
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
		// 상세보기 
		public LocationVO seoulDetailData(int no)
		{
			LocationVO vo = new LocationVO();
			try
			{
				  conn=dbConn.getConnection();
				String sql = "SELECT no, title, poster, msg, address "
										+"FROM seoul_location "
										+"WHERE no="+no;
				ps=conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setMsg(rs.getString(4));
				vo.setAddress(rs.getString(5));
				rs.close();
				
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally 
			{
				dbConn.disConnection(conn, ps);
			}
			return vo;
		}
}
