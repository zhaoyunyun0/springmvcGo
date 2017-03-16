package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;


import com.dao.DB;
import com.dao.OpDB;
import com.orm.TAdmin;
import com.orm.Yuangong;
public class loginService
{
	
	
	
	public String login(String userName,String userPw,int userType)
	{
		System.out.println("userType"+userType);
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		
		if(userType==0)//ϵͳ����Ա��½
		{
			String sql="select * from t_admin where userName=? and userPw=?";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			try 
			{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					 result="no";
				}
				else
				{
					 result="yes";
					 TAdmin admin=new TAdmin();
					 admin.setUserId(rs.getInt("userId"));
					 admin.setUserName(rs.getString("userName"));
					 admin.setUserPw(rs.getString("userPw"));
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", 0);
		             session.setAttribute("admin", admin);
				}
				rs.close();
			} 
			catch (SQLException e)
			{
				System.out.println("��¼ʧ�ܣ�");
				e.printStackTrace();
			}
			finally
			{
				mydb.closed();
			}
			
		}
		
		
		if(userType==1)
		{
			System.out.println("ddddddddddd");
			String sql="select * from t_yuangong where del='no' and loginName=? and loginPw=?";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			try 
			{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					 result="no";
				}
				else
				{
					 result="yes";
					 
					 Yuangong yuangong=new Yuangong();
					 yuangong.setId(rs.getInt("id"));
					 yuangong.setName(rs.getString("name"));
					 yuangong.setSex(rs.getString("sex"));
					 yuangong.setAge(rs.getString("age"));
					 yuangong.setTel(rs.getString("tel"));
					 yuangong.setAddress(rs.getString("address"));
					 yuangong.setZhiwei(rs.getString("zhiwei"));
					 yuangong.setQuanxian(rs.getInt("quanxian"));
					 yuangong.setLoginName(rs.getString("loginName"));
					 yuangong.setLoginPw(rs.getString("loginPw"));
					 
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", 1);
		             session.setAttribute("yuangong", yuangong);
					 
					
				}
				rs.close();
			} 
			catch (SQLException e)
			{
				System.out.println("��¼ʧ�ܣ�");
				e.printStackTrace();
			}
			finally
			{
				mydb.closed();
			}
		}
		if(userType==2)
		{
			
		}
		return result;
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		
		String sql="update t_admin set userPw=? where userId=?";
		Object[] params={userPwNew,admin.getUserId()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		
		return "yes";
    }
    
    
    
    public List yuangongSelect()
    {
    	List yuangongList=new ArrayList();
		String sql="select * from t_yuangong where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Yuangong yuangong=new Yuangong();
				yuangong.setId(rs.getInt("id"));
				yuangong.setName(rs.getString("name"));
				yuangongList.add(yuangong);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return yuangongList;
    }
}
