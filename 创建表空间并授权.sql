--创建表空间
CREATE TABLESPACE gisdata DATAFILE
  'D:\app\gisdata.DBF' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
LOGGING
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;


--创建用户并授权
CREATE USER gisdata IDENTIFIED BY gisdata
 DEFAULT TABLESPACE gisdata
 TEMPORARY TABLESPACE TEMP
 QUOTA UNLIMITED ON gisdata;
GRANT "CONNECT" TO gisdata WITH ADMIN OPTION;
GRANT "DBA" TO gisdata WITH ADMIN OPTION;
GRANT "RESOURCE" TO gisdata WITH ADMIN OPTION;
ALTER USER gisdata DEFAULT ROLE "CONNECT", "DBA", "RESOURCE";

--扩展表空间
ALTER database datafile 'D:\app\zzcoredata4.DBF' AUTOEXTEND ON
NEXT 50M
MAXSIZE 2000M;

imp system/hongzhi@orcl file=H:\重要图片\100zzcoredata1数据库备份\110DB.DMP fromuser=zzcoredata1 touser=zzcoredata3 ignore=y

将密码有效期由默认的180天修改成“无限制”：
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED; 

//查看当前连接数
select count(*) from v$process;
//查看最大连接数
select value from v$parameter where name = 'processes';
