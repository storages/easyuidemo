package com.gdc.init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.SessionFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.gdc.dao.MenuDao;

/**
 * 初始化数据
 * 
 * @author Administrator
 * 
 */
public class InitMenu implements ServletContextListener,
		ApplicationContextAware {
	private ApplicationContext ac;
	private MenuDao menuDao;

	@Override
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		// TODO Auto-generated method stub

	}

	public ApplicationContext getAc() {
		return ac;
	}

	public void setAc(ApplicationContext ac) {
		this.ac = ac;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void contextInitialized(ServletContextEvent sc) {
		ac = WebApplicationContextUtils.getWebApplicationContext(sc.getServletContext());
		menuDao = (MenuDao) ac.getBean("menuDao");
		System.out.println("----开始开始初始化数据----");
		String filePath = this.getPath() + File.separator + "sql.sql";
		List<String> sqlStr = this.getText(new File(filePath));
		for (String str : sqlStr) {
			if (str.contains("--") || "".equals(str.trim())) {
				continue;
			}
			menuDao.invocationInsertSql(str);
		}
		System.out.println("----初始化数据完成----");
	}

	/**
	 * 读取sql文件的中sql语句
	 * @param file
	 * @return
	 */
	private List getText(File file) {
		List list = new ArrayList();
		try {
			String encoding = "GBK";
			if (file.isFile() && file.exists()) { // 判断文件是否存在
				InputStreamReader read = new InputStreamReader(
						new FileInputStream(file), encoding);// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					list.add(lineTxt);
				}
				read.close();
			} else {
				System.out.println("找不到指定的文件");
			}
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
			e.printStackTrace();
		}
		return list;
	}

	public String getPath() {
		// 取得根目录路径
		String rootPath = getClass().getResource("/").getFile().toString();
		return rootPath;

	}

	private SessionFactory sessionFactory = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public MenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}
	
}
