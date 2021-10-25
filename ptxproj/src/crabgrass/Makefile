VERSION = 0.0.1

CC = $(CROSS_COMPILE)gcc

CFLAGS =-c -Wall -Wextra -Os
CFLAGS += -I$(SYSROOT)/usr/include/OsLinux/
CFLAGS += $(shell $(PKG_CONFIG) --cflags wago_diagnostic)
CFLAGS += -I$(SYSROOT)/usr/include/diagnostic/
CFLAGS += -I$(SYSROOT)/usr/lib/

CFLAGS += -DVERSION=\"$(VERSION)\"

#------------------------------------------------------------------------------
# Source Code
#------------------------------------------------------------------------------
SOURCES =  mqtt-cloud-agent.c
SOURCES += get_config.c
SOURCES += logger.c
SOURCES += mqtt.c
SOURCES += json.c
DEPENDS := +libconfig
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=crabgrass

#------------------------------------------------------------------------------
# Linker flags
#------------------------------------------------------------------------------
#LDFLAGS += -ldal -llibloader -lpthread -lffi -lrt -ldbus-glib-1 -lglib-2.0 
LDFLAGS = -lglib-2.0 
LDFLAGS += -ltypelabel 
LDFLAGS += -loslinux
LDFLAGS += -lconfig
LDFLAGS += -ljson-c
LDFLAGS += -lmosquitto

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf $(EXECUTABLE)
	rm -rf $(OBJECTS)

#-------------------------------------------
