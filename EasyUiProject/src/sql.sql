-- ����sqlserver2008 SQL

-- users��
insert into users(NAME,PASSWORD,EMAIL,ADDRESS) values(N'admin',N'admin',N'123456789@qq.com',N'�㶫ʡ��ݸ��');

-- menu��
insert into menu(ID,PID,TEXT,STATE,URL) values (N'0',NULL,N'��˶����ϵͳ',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values (N'1',N'0',N'ϵͳ����',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'10',N'2',N'������λ����',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'11',N'2',N'���׻��ҹ���',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'12',N'3',N'��������',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'13',N'3',N'���',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'14',N'3',N'����',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'15',N'3',N'���',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'16',N'1',N'����û�',N'closed',N'users_regester.action');
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'2',N'0',N'������������',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'3',N'0',N'���Ϲ���',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'4',N'0',N'���۹���',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'5',N'0',N'�������',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'6',N'1',N'Ȩ������',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'7',N'1',N'ϵͳ��־',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'8',N'2',N'�ͻ�����',N'closed',NULL);
insert  into menu(ID,PID,TEXT,STATE,URL) values(N'9',N'2',N'��Ӧ�̹���',N'closed',NULL);