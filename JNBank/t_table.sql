create tablespace CZSIBESB
datafile '/srv/oracledata/czsib.dbf'
size 50m
autoextend on
next 50m maxsize 20480m
extent management local; 

prompt PL/SQL Developer import file
prompt Created on 2016��12��27�� by T420
set feedback off
set define off
prompt Dropping T_MENUS...
drop table T_MENUS cascade constraints;
prompt Dropping T_ORGANIZATION...
drop table T_ORGANIZATION cascade constraints;
prompt Dropping T_ROLE...
drop table T_ROLE cascade constraints;
prompt Dropping T_ROLEMENU...
drop table T_ROLEMENU cascade constraints;
prompt Dropping T_USER...
drop table T_USER cascade constraints;
prompt Dropping T_USERROLE...
drop table T_USERROLE cascade constraints;
prompt Creating T_MENUS...
create table T_MENUS
(
  menuid       NUMBER(19) not null,
  menu_name_cn VARCHAR2(255 CHAR),
  menu_name_en VARCHAR2(255 CHAR),
  icon_cls     VARCHAR2(255 CHAR),
  type         VARCHAR2(255 CHAR),
  url          VARCHAR2(255 CHAR),
  parentid     VARCHAR2(255 CHAR),
  deep         VARCHAR2(255 CHAR),
  orderid      VARCHAR2(255 CHAR)
)
tablespace CZSIBESB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_MENUS
  is 'ģ��';
create index TOT_SVC_LOG4 on T_MENUS (URL)
  tablespace CZSIBESB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_MENUS
  add primary key (MENUID)
  using index 
  tablespace CZSIBESB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_ORGANIZATION...
create table T_ORGANIZATION
(
  orgid     NUMBER(19) not null,
  org_name  VARCHAR2(255),
  parentid  VARCHAR2(255),
  orglength VARCHAR2(255),
  position  VARCHAR2(255),
  remark    VARCHAR2(255)
)
tablespace CZSIBESB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_ORGANIZATION
  add primary key (ORGID)
  using index 
  tablespace CZSIBESB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_ROLE...
create table T_ROLE
(
  roleid     NUMBER(19) not null,
  rolenamecn VARCHAR2(255),
  rolenameen VARCHAR2(255),
  roledesc   VARCHAR2(255)
)
tablespace CZSIBESB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_ROLE
  is '��ɫ';
alter table T_ROLE
  add primary key (ROLEID)
  using index 
  tablespace CZSIBESB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_ROLEMENU...
create table T_ROLEMENU
(
  rolemenuid NUMBER(19) not null,
  roleid     NUMBER(19),
  menuid     NUMBER(19)
)
tablespace CZSIBESB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_ROLEMENU
  add primary key (ROLEMENUID)
  using index 
  tablespace CZSIBESB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_ROLEMENU
  add constraint FKA6D3DE40A6F01588 foreign key (MENUID)
  references T_MENUS (MENUID);
alter table T_ROLEMENU
  add constraint FKA6D3DE40B00681F6 foreign key (ROLEID)
  references T_ROLE (ROLEID);

prompt Creating T_USER...
create table T_USER
(
  userid   NUMBER(19) not null,
  username VARCHAR2(255),
  account  VARCHAR2(255),
  userpwd  VARCHAR2(255),
  mobileno VARCHAR2(255),
  status   VARCHAR2(255),
  deptid   NUMBER(19),
  remark   VARCHAR2(255)
)
tablespace CZSIBESB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_USER
  add primary key (USERID)
  using index 
  tablespace CZSIBESB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_USER
  add constraint FKCB63CCB6928A55C2 foreign key (DEPTID)
  references T_ORGANIZATION (ORGID);

prompt Creating T_USERROLE...
create table T_USERROLE
(
  urid   NUMBER(19) not null,
  userid NUMBER(19),
  roleid NUMBER(19)
)
tablespace CZSIBESB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_USERROLE
  add primary key (URID)
  using index 
  tablespace CZSIBESB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_USERROLE
  add constraint FKA6D8022CB00681F6 foreign key (ROLEID)
  references T_ROLE (ROLEID);
alter table T_USERROLE
  add constraint FKA6D8022CB55BD760 foreign key (USERID)
  references T_USER (USERID);

prompt Disabling triggers for T_MENUS...
alter table T_MENUS disable all triggers;
prompt Disabling triggers for T_ORGANIZATION...
alter table T_ORGANIZATION disable all triggers;
prompt Disabling triggers for T_ROLE...
alter table T_ROLE disable all triggers;
prompt Disabling triggers for T_ROLEMENU...
alter table T_ROLEMENU disable all triggers;
prompt Disabling triggers for T_USER...
alter table T_USER disable all triggers;
prompt Disabling triggers for T_USERROLE...
alter table T_USERROLE disable all triggers;
prompt Disabling foreign key constraints for T_ROLEMENU...
alter table T_ROLEMENU disable constraint FKA6D3DE40A6F01588;
alter table T_ROLEMENU disable constraint FKA6D3DE40B00681F6;
prompt Disabling foreign key constraints for T_USER...
alter table T_USER disable constraint FKCB63CCB6928A55C2;
prompt Disabling foreign key constraints for T_USERROLE...
alter table T_USERROLE disable constraint FKA6D8022CB00681F6;
alter table T_USERROLE disable constraint FKA6D8022CB55BD760;
prompt Loading T_MENUS...
INSERT INTO T_ROLE values(1,'sysManager','ROLE_SYSTEM','ROLE_SYSTEM');
INSERT INTO T_ROLE values(2,'sysUser','ROLE_USER','ROLE_USER');
INSERT INTO T_ROLEMENU VALUES(1,1,1);
INSERT INTO T_ROLEMENU VALUES(2,2,2);

INSERT INTO T_ORGANIZATION VALUES(1,'ROOT','-1',NULL,NULL,NULL);
INSERT INTO T_ORGANIZATION VALUES(2,'XIAN','1',NULL,NULL,NULL);
INSERT INTO T_ORGANIZATION VALUES(3,'PCM','2',NULL,NULL,NULL);
INSERT INTO T_USER VALUES(1,'SYSTEM','system','b2a31ecb19f98ff989215ac1e566b02a','00000000000','1',1,NULL);
INSERT INTO T_USER VALUES(2,'Admin','admin','1b771698e9d4723bfd35818165db49b7','15829705658','1',3,NULL);

INSERT INTO T_USERROLE VALUES(1,1,1);
INSERT INTO T_USERROLE VALUES(2,2,2);

insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (48, '�������ݷ�������', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0005011', '46', '2', '210001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (107, 'ְ��ָ�����¹�����ɽ���Ϣ��ѯ', '220001', null, 'button', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003031', '65', '2', null);
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (109, '�����𿪻���λ����ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003041', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (111, '��¼У��', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003051', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (115, 'ְ����ˮ�ʲ�ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003071', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (117, 'ְ��δ���������Ϣ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003081', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (158, 'ҽ�Ʒ�����ϸ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006023', '156', '2', '230002');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (166, '������Ϣ�޸�', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008061', '163', '2', '240003');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (167, '�ɷѼƻ�ȡ��', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008071', '163', '2', '240004');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (169, '�ɷѼƻ���ϸ���ݶ���', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008093', '163', '2', '240006');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (1, '#', '#', '#', 'menu', '/home/system/**', '0', '3', '1');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (2, '#', '#', '#', 'menu', '/home/app/**', '0', '3', '2');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (3, '������ϸ���', null, null, 'menu', null, '-1', '1', '100000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (4, '��ϸ���', null, null, 'menu', '/home/app/svcLog/svcLogAction!reportTotal.action', '3', '2', '110000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (9, '����������', null, null, 'menu', null, '-1', '1', '200000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (10, '����', null, null, 'menu', null, '-1', '1', '300000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (11, '�ۺϲ�ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!goTotalPage.action', '10', '2', '3100000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (12, '�ճ�Ѳ�챨��', null, null, 'menu', '/home/app/svcLog/svcLogAction!listReports.action', '10', '2', '3200000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (13, '�ƻ���������״����ѯ��', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0004021', '9', '2', '210000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (14, '����������ϵ��', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0004011', '9', '2', '220000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (46, '����������', null, null, 'menu', null, '-1', '1', '210000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (65, '�����������', null, null, 'menu', null, '-1', '1', '220000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (105, 'ְ�������������Ϣ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003021', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (68, '��λ�����������Ϣ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003011', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (113, 'ְ��������Ϣ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003061', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (119, 'ְ��δ���������¼��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003091', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (156, '��۷�����', null, null, 'menu', null, '-1', '1', '230000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (159, '��λ��Ϣ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006033', '156', '2', '230003');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (160, 'ҽ�Ʒ�����ʩ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006043', '156', '2', '230004');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (161, '����ṹ��Ϣ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006053', '156', '2', '230005');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (162, '���ֲ���ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006063', '156', '2', '230006');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (163, '��˰������', null, null, 'menu', null, '-1', '1', '240000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (157, 'ҽ��Ŀ¼ҩƷ��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006013', '156', '2', '230001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (164, '������Ϣ�Ǽ�', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008011', '163', '2', '240001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (165, '�ɷѼƻ�����', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008021', '163', '2', '240002');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (168, '�ƻ�״̬��ѯ', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008081', '163', '2', '240005');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (170, 'ʵ�����յ�����ϸ���ݶ���', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008103', '163', '2', '240007');
commit;
prompt 37 records loaded
prompt Loading T_ORGANIZATION...
prompt Table is empty
prompt Loading T_ROLE...
prompt Table is empty
prompt Loading T_ROLEMENU...
prompt Table is empty
prompt Loading T_USER...
prompt Table is empty
prompt Loading T_USERROLE...
prompt Table is empty
prompt Enabling foreign key constraints for T_ROLEMENU...
alter table T_ROLEMENU enable constraint FKA6D3DE40A6F01588;
alter table T_ROLEMENU enable constraint FKA6D3DE40B00681F6;
prompt Enabling foreign key constraints for T_USER...
alter table T_USER enable constraint FKCB63CCB6928A55C2;
prompt Enabling foreign key constraints for T_USERROLE...
alter table T_USERROLE enable constraint FKA6D8022CB00681F6;
alter table T_USERROLE enable constraint FKA6D8022CB55BD760;
prompt Enabling triggers for T_MENUS...
alter table T_MENUS enable all triggers;
prompt Enabling triggers for T_ORGANIZATION...
alter table T_ORGANIZATION enable all triggers;
prompt Enabling triggers for T_ROLE...
alter table T_ROLE enable all triggers;
prompt Enabling triggers for T_ROLEMENU...
alter table T_ROLEMENU enable all triggers;
prompt Enabling triggers for T_USER...
alter table T_USER enable all triggers;
prompt Enabling triggers for T_USERROLE...
alter table T_USERROLE enable all triggers;
set feedback on
set define on
prompt Done.
