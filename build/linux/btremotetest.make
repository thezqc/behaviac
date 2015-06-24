# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug64
endif

ifndef verbose
  SILENT = @
endif

CC = gcc
CXX = g++
AR = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../intermediate/debug/linux/btremotetest/x64
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/btremotetest_debugstatic_linux_gmake.exe
  DEFINES   += -D_DEBUG -DDEBUG
  INCLUDES  += -I../../inc -I../../inc -I../../../../include -I../../test/btunittest
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -Wall -Wextra -ffast-math -m64 -Wno-reorder -Wno-invalid-offsetof -Wno-array-bounds -Wno-unused-local-typedefs -Wno-maybe-uninitialized -finput-charset=UTF-8  -Wno-unused-parameter -Wno-unused-variable
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS) -fno-exceptions -fno-rtti
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../../lib -L../../lib -m64 -L/usr/lib64
  LDDEPS    += ../../lib/libbehaviac_debugstatic_linux_gmake.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS) -lpthread
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../intermediate/release/linux/btremotetest/x64
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/btremotetest_releasestatic_linux_gmake.exe
  DEFINES   += -DWIN32 -DNDEBUG
  INCLUDES  += -I../../inc -I../../inc -I../../../../include -I../../test/btunittest
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -Wall -Wextra -ffast-math -m64 -Wno-reorder -Wno-invalid-offsetof -Wno-array-bounds -Wno-unused-local-typedefs -Wno-maybe-uninitialized -finput-charset=UTF-8 -Wno-unused-parameter -Wno-unused-variable
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS) -fno-exceptions -fno-rtti
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../../lib -L../../lib -s -m64 -L/usr/lib64
  LDDEPS    += ../../lib/libbehaviac_releasestatic_linux_gmake.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS) -lpthread
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),profile64)
  OBJDIR     = ../../intermediate/profile/linux/btremotetest/x64
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/btremotetest_profilestatic_linux_gmake.exe
  DEFINES   += -DWIN32 -DNDEBUG -DBEHAVIAC_CFG_PROFILE -D_CONSOLE
  INCLUDES  += -I../../inc -I../../inc -I../../../../include -I../../test/btunittest
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -Wall -Wextra -ffast-math -m64 -Wno-reorder -Wno-invalid-offsetof -Wno-array-bounds -Wno-unused-local-typedefs -Wno-maybe-uninitialized -finput-charset=UTF-8 /Od /Z7 -Wno-unused-parameter -Wno-unused-variable
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS) -fno-exceptions -fno-rtti
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L../../../../lib -L../../lib -s -m64 -L/usr/lib64 /DEBUG 
  LDDEPS    += ../../lib/libbehaviac_profilestatic_win32_gmake.a
  LIBS      += $(LDDEPS)
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS) -lpthread
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/btremotetest.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking btremotetest
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning btremotetest
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
.NOTPARALLEL: $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -MMD -MP $(DEFINES) $(INCLUDES) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/btremotetest.o: ../../test/btremotetest/btremotetest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif