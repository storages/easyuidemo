package com.gdc.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * �˵���
 * @author Administrator
 *
 */
public class Menu implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String pid;//�˵���Id
	private String text;//�˵�����
	private String state = "closed";//�Ƿ��ǹرյĽڵ�
	private String url;//�˵������ӵ�ַ
	private Menu menu;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	

}
