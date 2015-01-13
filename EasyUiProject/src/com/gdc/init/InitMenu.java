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
 * ��ʼ������
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
		System.out.println("----��ʼ��ʼ��ʼ������----");
		String filePath = this.getPath() + File.separator + "sql.sql";
		List<String> sqlStr = this.getText(new File(filePath));
		for (String str : sqlStr) {
			if (str.contains("--") || "".equals(str.trim())) {
				continue;
			}
			menuDao.invocationInsertSql(str);
		}
		System.out.println("----��ʼ���������----");
	}

	/**
	 * ��ȡsql�ļ�����sql���
	 * @param file
	 * @return
	 */
	private List getText(File file) {
		List list = new ArrayList();
		try {
			String encoding = "GBK";
			if (file.isFile() && file.exists()) { // �ж��ļ��Ƿ����
				InputStreamReader read = new InputStreamReader(
						new FileInputStream(file), encoding);// ���ǵ������ʽ
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					list.add(lineTxt);
				}
				read.close();
			} else {
				System.out.println("�Ҳ���ָ�����ļ�");
			}
		} catch (Exception e) {
			System.out.println("��ȡ�ļ����ݳ���");
			e.printStackTrace();
		}
		return list;
	}

	public String getPath() {
		// ȡ�ø�Ŀ¼·��
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
