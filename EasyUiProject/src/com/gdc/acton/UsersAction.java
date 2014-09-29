package com.gdc.acton;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.gdc.domain.Users;
import com.gdc.service.UsersService;
import com.gdc.util.JsonResult;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UsersAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UsersService usersService = null;
	private Users users;
	private String usersname;
	private String pass;
	HttpServletResponse response;

	/** 获取输出out对象 */
	PrintWriter out = null;

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public String getUsersname() {
		return usersname;
	}

	public void setUsersname(String usersname) {
		this.usersname = usersname;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public void save() {
		System.out.println("姓名：" + users.getName());
		System.out.println("密码：" + users.getPassword());
		System.out.println("邮箱：" + users.getEmail());
		System.out.println("地址：" + users.getAddress());
		usersService.save(users);
	}

	public void login() {
		ActionContext ctx = ActionContext.getContext();
		/** 获取response对象 */
		response = (HttpServletResponse) ctx
				.get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		response.setCharacterEncoding("UTF-8");
		Gson g = new Gson();
		JsonResult jr = new JsonResult();
		try {
			Users u = this.usersService.findUser(usersname, pass);
			if (null != u) {
				jr.setInfo("登录成功!");
				jr.setObj(u);
				jr.setIsSuccess(true);
			} else {
				jr.setInfo("登录失败!");
				jr.setIsSuccess(false);
			}
			out = response.getWriter();

			out.println(g.toJson(jr));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void view() {
		try {
			Users u = new Users();
			u.setName(usersname);
			List<Users> list = this.usersService.view(u);
			ActionContext ctx = ActionContext.getContext();
			response = (HttpServletResponse) ctx.get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
			response.setCharacterEncoding("UTF-8");
			Gson g = new Gson();
			out = response.getWriter();
			String str = g.toJson(list);
			System.out.println(str);
			out.print(str);
			//return "view";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return "view";
	}

	public String inMain() {
		return this.SUCCESS;
	}

	public String regester() {
		return "reg";
	}
}
