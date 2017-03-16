package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

public class OpDB
{
	private DB mydb;

	public OpDB()
	{
		mydb = new DB();
	}

	

	public int OpUpdate(String sql, Object[] params)
	{
		int i = -1;
		mydb.doPstm(sql, params);
		try
		{
			i = mydb.getCount();
		} catch (SQLException e)
		{
			System.out.println("执行OpUpdate()方法失败！(更新数据库)");
			e.printStackTrace();
		} finally
		{
			mydb.closed();
		}
		return i;
	}

	public boolean LogOn(String sql, Object[] params)
	{
		mydb.doPstm(sql, params);
		try
		{
			ResultSet rs = mydb.getRs();
			boolean mark = (rs == null || !rs.next() ? false : true);
			rs.close();
			return mark;
		} catch (SQLException e)
		{
			System.out.println("登录失败！");
			e.printStackTrace();
			return false;
		} finally
		{
			mydb.closed();
		}
	}
}
