create tablespace CZSIBESB
datafile '/srv/oracledata/czsib.dbf'
size 50m
autoextend on
next 50m maxsize 20480m
extent management local; 

prompt PL/SQL Developer import file
prompt Created on 2016年12月27日 by T420
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
  is '模块';
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
  is '角色';
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
values (48, '银联数据访问请求', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0005011', '46', '2', '210001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (107, '职工指定年月公积金缴交信息查询', '220001', null, 'button', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003031', '65', '2', null);
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (109, '公积金开户单位清册查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003041', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (111, '登录校验', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003051', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (115, '职工流水帐查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003071', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (117, '职工未还清贷款信息查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003081', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (158, '医疗费用明细查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006023', '156', '2', '230002');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (166, '基本信息修改', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008061', '163', '2', '240003');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (167, '缴费计划取消', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008071', '163', '2', '240004');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (169, '缴费计划明细数据对账', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008093', '163', '2', '240006');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (1, '#', '#', '#', 'menu', '/home/system/**', '0', '3', '1');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (2, '#', '#', '#', 'menu', '/home/app/**', '0', '3', '2');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (3, '服务明细监控', null, null, 'menu', null, '-1', '1', '100000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (4, '明细监控', null, null, 'menu', '/home/app/svcLog/svcLogAction!reportTotal.action', '3', '2', '110000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (9, '计生服务监控', null, null, 'menu', null, '-1', '1', '200000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (10, '报表', null, null, 'menu', null, '-1', '1', '300000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (11, '综合查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!goTotalPage.action', '10', '2', '3100000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (12, '日常巡检报告', null, null, 'menu', '/home/app/svcLog/svcLogAction!listReports.action', '10', '2', '3200000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (13, '计划生育政策状况查询单', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0004021', '9', '2', '210000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (14, '生育服务联系单', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0004011', '9', '2', '220000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (46, '银联服务监控', null, null, 'menu', null, '-1', '1', '210000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (65, '公积金服务监控', null, null, 'menu', null, '-1', '1', '220000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (105, '职工公积金基本信息查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003021', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (68, '单位公积金基本信息查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003011', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (113, '职工基本信息查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003061', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (119, '职工未还清贷款还款记录查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0003091', '65', '2', '220001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (156, '物价服务监控', null, null, 'menu', null, '-1', '1', '230000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (159, '单位信息查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006033', '156', '2', '230003');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (160, '医疗服务设施查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006043', '156', '2', '230004');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (161, '结算结构信息查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006053', '156', '2', '230005');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (162, '特种病查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006063', '156', '2', '230006');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (163, '地税服务监控', null, null, 'menu', null, '-1', '1', '240000');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (157, '医保目录药品查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0006013', '156', '2', '230001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (164, '基本信息登记', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008011', '163', '2', '240001');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (165, '缴费计划发送', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008021', '163', '2', '240002');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (168, '计划状态查询', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008081', '163', '2', '240005');
insert into T_MENUS (menuid, menu_name_cn, menu_name_en, icon_cls, type, url, parentid, deep, orderid)
values (170, '实际征收到帐明细数据对账', null, null, 'menu', '/home/app/svcLog/svcLogAction!findAllSvcLogs.action?svcLog.svcId=S0008103', '163', '2', '240007');
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
