-- 这是sqlserver2008 SQL

-- users表
insert into users(NAME,PASSWORD,EMAIL,ADDRESS) values('admin','admin','123456789@qq.com','广东省东莞市');

-- menu表
insert into menu(ID,PID,TEXT,STATE,URL) values (N'0',NULL,N'联硕管理系统',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values (N'1',N'0',N'系统设置',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'10',N'2',N'计量单位管理',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'11',N'2',N'交易货币管理',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'12',N'3',N'物料类型',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'13',N'3',N'入库',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'14',N'3',N'出库',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'15',N'3',N'库存',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'16',N'1',N'添加用户',N'closed',N'users_regester.action');
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'2',N'0',N'基础资料设置',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'3',N'0',N'物料管理',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'4',N'0',N'销售管理',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'5',N'0',N'财务管理',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'6',N'1',N'权限设置',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'7',N'1',N'系统日志',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'8',N'2',N'客户管理',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'9',N'2',N'供应商管理',N'closed',NULL);

