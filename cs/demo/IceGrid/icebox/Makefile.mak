# **********************************************************************
#
# Copyright (c) 2003-2009 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= ..\..\..

TARGETS		= client.exe helloservice.dll
TARGETS_CONFIG	= client.exe.config

C_SRCS		= Client.cs
S_SRCS		= HelloI.cs HelloServiceI.cs

GEN_SRCS	= $(GDIR)\Hello.cs

SDIR		= .

GDIR		= generated

!include $(top_srcdir)\config\Make.rules.mak.cs

MCSFLAGS	= $(MCSFLAGS) -target:exe

SLICE2CSFLAGS	= $(SLICE2CSFLAGS) --ice -I. -I$(slicedir)

client.exe: $(C_SRCS) $(GEN_SRCS)
	$(MCS) $(MCSFLAGS) -out:$@ -r:$(refdir)\Ice.dll $(C_SRCS) $(GEN_SRCS)

helloservice.dll: $(S_SRCS) $(GEN_SRCS)
	$(MCS) $(MCSFLAGS) -target:library -out:$@ -r:$(refdir)\IceBox.dll -r:$(refdir)\Ice.dll \
		$(S_SRCS) $(GEN_SRCS)

clean::
	for %f in (db\registry\*) do if not %f == db\registry\.gitignore del /q %f
	for %f in (distrib servers tmp) do if exist db\node\%f rmdir /s /q db\node\%f

!include .depend