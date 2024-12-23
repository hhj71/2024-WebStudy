package com.sist.service;
import java.util.*;
import java.sql.*;
import com.sist.dao.*;

public class EmpDAO {
		private Connection conn;
		private PreparedStatement ps;
		private static EmpDAO dao;
		private DbcpConnection dbConn = new DbcpConnection();
		
		public static EmpDAO newInstance()
		{
				if(dao==null)
					dao=new EmpDAO();
				return dao;
		}
		
		public List<EmpVO> empListData()
		{
			List<EmpVO> list = new ArrayList<EmpVO>();
			try 
			{
				conn = dbConn.getConnection();
				String sql = "SELECT empno, ename, job, hiredate, sal "
									+"FROM emp";
				ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					EmpVO vo = new EmpVO();
					vo.setEmpvo(rs.getInt(1));
					vo.setEname(rs.getString(2));
					vo.setJob(rs.getString(3));
					vo.setHiredate(rs.getDate(4));
					vo.setSal(rs.getInt(5));
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
}
