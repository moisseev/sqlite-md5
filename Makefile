libsqlitemd5.so: md5.c
	cc -I/usr/local/include -lm -fPIC -shared md5.c -o libsqlitemd5.so

.PHONY: test
test: libsqlitemd5.so
	sqlite3 :memory: '.read md5.sql'

