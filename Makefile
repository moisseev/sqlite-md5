TARGET = libsqlitemd5.so
PREFIX ?= /usr/local

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
  PREFIX := $(shell brew --prefix)/opt/sqlite
endif

CFLAGS += -I${PREFIX}/include -fPIC -lm -shared

.PHONY: all clean install test uninstall

all: $(TARGET)

$(TARGET): md5.c
	$(CC) $(LFLAGS) $(CFLAGS) md5.c -o $(TARGET)

test: $(TARGET)
ifeq ($(UNAME_S),Darwin)
	$(shell brew --prefix)/opt/sqlite/bin/sqlite3 :memory: '.read md5.sql'
else
	sqlite3 :memory: '.read md5.sql'
endif

install: $(TARGET)
	install -m 0444 $(TARGET) $(PREFIX)/lib

clean:
	rm $(TARGET)

uninstall:
	rm $(PREFIX)/lib/$(TARGET)
