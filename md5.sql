.load ./libsqlitemd5.so

create table t1(x);
insert into t1 values (1);
insert into t1 values (2);
insert into t1 values (3);

select 'ERROR' where (select hex(group_md5(x)) from t1)!='202CB962AC59075B964B07152D234B70';
drop table t1;

select 'ERROR' where hex(md5(''))!='D41D8CD98F00B204E9800998ECF8427E';
select 'ERROR' where hex(md5_utf16('a'))!='4144E195F46DE78A3623DA7364D04F11';
select 'ERROR' where hex(md5file('md5.c'))!='aca7c0e51f6dcda1419414105cded019' collate nocase;
