package com.siec.chart;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ChartDAO {

//DB 연결 메소드
		private Connection getConnection() 
		{
			DataSource i_ds = null;
			Connection i_con = null;
				try
				{
				
					Context i_ctx = new InitialContext();
					i_ds = (DataSource) i_ctx.lookup("java:comp/env/jdbc/MSSQL");
					i_con = i_ds.getConnection();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return i_con;
		}
		
// DB 닫기
		private void closeConnection(Connection con)
		{
				if(con!=null)
				{
					try
					{
						con.close();
					}
					catch(Exception e){}
				}
		}

		public ArrayList<ChartVO> selectAllData2()
		{
			ArrayList<ChartVO> datas = null;
			Connection con = null;

			try
			{
				datas = new ArrayList<ChartVO>();
				con = getConnection();
				String sql = "select * from dbo.test";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					ChartVO vo = new ChartVO();
				    vo.setGoal(rs.getString("goal"));
					vo.setPerformance(rs.getString("performance"));
					vo.setRate(rs.getString("rate"));
					datas.add(vo);
				}
				
				
			}
			catch(SQLException e)
			{
				System.out.println(e.getMessage());

			}
		return datas;
		}
	
		public static void main(String[] args) { }
		
		
			
		}


