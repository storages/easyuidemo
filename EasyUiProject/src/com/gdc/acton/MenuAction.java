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
import com.gdc.util.JsonResult;
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
	/*public void getMenu() {
		List<Menu> list = this.menuService.getMenu();
		Map<String, List<Menu>> menuTreeMap = new HashMap<String, List<Menu>>();
		if (null != nid && !"".equals(nid.trim())) {
			try {
				Gson g = new Gson();
				String str = g.toJson(this.recursiveTree(Integer.parseInt(nid)));
				System.out.println(g.toJson(str));
				ActionContext ctx = ActionContext.getContext();
				*//** 获取response对象 *//*
				response = (HttpServletResponse) ctx.get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
				response.setCharacterEncoding("UTF-8");
				//JsonResult jr = new JsonResult();
				out = response.getWriter();
				out.print(str);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// g.toJson(lists);
	}

	*//**
	 * 获取根节点
	 * 
	 * @param list
	 * @return
	 *//*
	
	 * private List<Menu> getRoot(List<Menu> list) { Map<String, Menu> parentMap
	 * = new HashMap<String, Menu>(); Map<String, List<Menu>> menuTreeMap = new
	 * HashMap<String, List<Menu>>(); List<Menu> parentList = new
	 * ArrayList<Menu>(); for (Menu m : list) { parentMap.put(m.getId() + "",
	 * m); } for (Menu menu : list) { if (null == parentMap.get(menu.getPid() +
	 * "")) { parentList.add(menu); } } return parentList; }
	 

	public Menu recursiveTree(int cid) {
		// 根据cid获取节点对象(SELECT * FROM tb_tree t WHERE t.cid=?)
		Menu node = menuService.getreeNode(cid);
		// 查询cid下的所有子节点(SELECT * FROM tb_tree t WHERE t.pid=?)
		List<Menu> childTreeNodes = menuService.queryTreeNode(cid);
		// 遍历子节点
		for (Menu child : childTreeNodes) {
			Menu n = recursiveTree(child.getId()); // 递归
			node.getChildren().add(n);
		}

		return node;
	}*/
}
