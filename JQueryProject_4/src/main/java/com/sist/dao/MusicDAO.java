package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class MusicDAO {
	private static SqlSessionFactory ssf;
	static 
	{
		try
		{
			// XML => ssf 에 전송
			Reader reader = Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			// xml 파싱
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	// 기능
	/*
	 * SELECT mno, title, singer, album, poster, state, idcrement, rownum
 		FROM(SELECT mno, title, singer, album, poster, state, idcrement
 		FROM genie_music ORDER BY mno ASC)
 		WHERE rownum &lt;= 50
	 */
	public static List<MusicVO> musicListData()
	{
		List<MusicVO> list = new ArrayList<MusicVO>();
		// XML => Annotation (반환)  => 스프링
		SqlSession session = null;
		try
		{
			session = ssf.openSession(); // getConnection()
			list = session.selectList("musicListData"); // map(id, sql)
			// id가 중복되면 안된다
		}catch(Exception ex)
		{
			 ex.printStackTrace(); // 컴파일 예외처리가 아니다 => 에러 처리
		}
		finally
		{
			if(session!=null)
				session.close(); //POOL 반환 -> 재사용
		}
		return list;
	}
}
