package com.gdc.acton;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.gdc.domain.EasyUiNode;
import com.gdc.domain.Menu;
import com.gdc.service.MenuService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MenuAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MenuService menuService;
	private String id;
	HttpServletResponse response;

	/** 获取输出out对象 */
	PrintWriter out = null;

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void getMenu(){
		List<Menu> menus = this.menuService.getMenu(id);
		List<EasyUiNode> tree = new ArrayList<EasyUiNode>();
		for(Menu m : menus){
			EasyUiNode node = new EasyUiNode();
			if(m.getPid()==null || "".equals(m.getPid().trim())){
				node.setIconCls("icon-treeroot");
			}
			node.setId(m.getId());
			node.setText(m.getText());
			Map<String,String> attributes = new HashMap<String,String>();
			attributes.put("url", m.getUrl());
			node.setAttributes(attributes);
			Integer count = this.menuService.countChildren(node.getId());
			if(count>0){
				node.setState("closed");
			}
			tree.add(node);
		}
		writeJson(tree);
	}

	
	private void writeJson(List list){
		if(null!=list && list.size()>0){
			try {
				Gson g = new Gson();
				ActionContext ctx = ActionContext.getContext();
				//** 获取response对象 *//*
				response = (HttpServletResponse) ctx.get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
				response.setCharacterEncoding("UTF-8");
				out = response.getWriter();
				id = null;
				System.out.println(g.toJson(list));
				out.print(g.toJson(list));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
