TARGET = libsqlitemd5.so
PREFIX ?= /usr/local
CFLAGS += -I${PREFIX}/include -fPIC -lm -shared

.PHONY: all clean install test uninstall

all: $(TARGET)

$(TARGET): md5.c
	$(CC) $(CFLAGS) md5.c -o $(TARGET)

test: $(TARGET)
	sqlite3 :memory: '.read md5.sql'

install: $(TARGET)
	install -m 0444 $(TARGET) $(PREFIX)/lib

clean:
	rm $(TARGET)

uninstall:
	rm $(PREFIX)/lib/$(TARGET)
