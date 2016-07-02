--������ռ�
CREATE TABLESPACE gisdata DATAFILE
  'D:\app\gisdata.DBF' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
LOGGING
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

--�����û�����Ȩ
CREATE USER gisdata IDENTIFIED BY gisdata
 DEFAULT TABLESPACE gisdata
 TEMPORARY TABLESPACE TEMP
 QUOTA UNLIMITED ON gisdata;
GRANT "CONNECT" TO gisdata WITH ADMIN OPTION;
GRANT "DBA" TO gisdata WITH ADMIN OPTION;
GRANT "RESOURCE" TO gisdata WITH ADMIN OPTION;
ALTER USER gisdata DEFAULT ROLE "CONNECT", "DBA", "RESOURCE";

--��չ��ռ�
ALTER database datafile 'D:\app\zzcoredata4.DBF' AUTOEXTEND ON
NEXT 50M
MAXSIZE 2000M;

imp system/hongzhi@orcl file=H:\��ҪͼƬ\100zzcoredata1���ݿⱸ��\110DB.DMP fromuser=zzcoredata1 touser=zzcoredata3 ignore=y

��������Ч����Ĭ�ϵ�180���޸ĳɡ������ơ���
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED; 

//�鿴��ǰ������
select count(*) from v$process;
//�鿴���������
select value from v$parameter where name = 'processes';
