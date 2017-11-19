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

## Usage examples

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

You can enter a string in the console's encoding and use the `MD5_UTF16` method to get the MD5 hash of the UTF-16 representation of the given string. The method does not depend on the database encoding.
~~~sql
% sqlite3 :memory:

sqlite> .load libsqlitemd5.so

sqlite> .shell echo -n a | md5
0cc175b9c0f1b6a831c399e269772661
sqlite> select hex(md5('a'));
0CC175B9C0F1B6A831C399E269772661

sqlite> .shell echo -n a | iconv -t utf16le | md5
4144e195f46de78a3623da7364d04f11

sqlite> pragma encoding;
UTF-8
sqlite> select hex(md5_utf16('a'));
4144E195F46DE78A3623DA7364D04F11

sqlite> pragma encoding = "UTF-16be";
sqlite> select hex(md5_utf16('a'));
4144E195F46DE78A3623DA7364D04F11
~~~

## License

This code in Public Domain

## Acknowledgements

The code is based heavily on the [now deprecated](http://sqlite.mobigroup.ru/info/4bc6cd8ee0d78355) [MBG SQLite's](http://sqlite.mobigroup.ru) [md5](http://sqlite.mobigroup.ru/dir?name=ext/md5) extension by Alexey Pechnikov <pechnikov@mobigroup.ru>.
