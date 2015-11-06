# sqlite-md5

The MD5 SQLite extension library provides the following MD5 message-digest
algorithm functions (loaded with `.load libsqlitemd5.so`):
- GROUP_MD5
- MD5
- MD5FILE


## Usage example

~~~sql
.load libsqlitemd5.so

create table t1(x);
insert into t1 values (1);
insert into t1 values (2);
insert into t1 values (3);
select hex(group_md5(x)) from t1;

select hex(md5(''));

select hex(md5file('/tmp/somefile'));
~~~
