# sqlite-md5

The MD5 SQLite extension library provides the following MD5 message-digest
algorithm functions (loaded with `.load libsqlitemd5.so`):
- GROUP_MD5
- MD5
- MD5_UTF16 - returns the md5 hash of an UTF-16 representation of a string
- MD5FILE

## Installation
~~~
% make
% make test
# make install
~~~
FreeBSD users can install sqlite-md5 from [port](https://github.com/moisseev/unofficial-freebsd-ports/tree/master/databases/sqlite-md5) (unofficial).

## Usage example

~~~sql
.load libsqlitemd5.so

create table t1(x);
insert into t1 values (1);
insert into t1 values (2);
insert into t1 values (3);
select hex(group_md5(x)) from t1;

select hex(md5(''));

select hex(md5_utf16('a'));

select hex(md5file('/tmp/somefile'));
~~~

## License

This code in Public Domain

## Acknowledgements

The code is based heavily on the [now deprecated](http://sqlite.mobigroup.ru/info/4bc6cd8ee0d78355) [MBG SQLite's](http://sqlite.mobigroup.ru) [md5](http://sqlite.mobigroup.ru/dir?name=ext/md5) extension by Alexey Pechnikov <pechnikov@mobigroup.ru>.
