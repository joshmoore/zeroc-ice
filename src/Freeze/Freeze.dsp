# Microsoft Developer Studio Project File - Name="Freeze" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=Freeze - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Freeze.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Freeze.mak" CFG="Freeze - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Freeze - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Freeze - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Freeze - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "LIBRARY_EXPORTS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /WX /GR /GX /O2 /I ".." /I "../../include" /D "_USRDLL" /D "FREEZE_API_EXPORTS" /D "NDEBUG" /D "_CONSOLE" /D "_UNICODE" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 libdb41.lib /nologo /dll /machine:I386 /out:"Release/freeze12.dll" /implib:"Release/freeze.lib" /libpath:"../../../lib"
# SUBTRACT LINK32 /pdb:none /debug /nodefaultlib
# Begin Special Build Tool
OutDir=.\Release
SOURCE="$(InputPath)"
PostBuild_Cmds=copy $(OutDir)\freeze.lib ..\..\lib	copy $(OutDir)\freeze12.dll ..\..\bin
# End Special Build Tool

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "LIBRARY_EXPORTS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /WX /Gm /GR /GX /Zi /Od /I ".." /I "../../include" /D "_USRDLL" /D "FREEZE_API_EXPORTS" /D "_DEBUG" /D "_CONSOLE" /D "_UNICODE" /FD /GZ /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386
# ADD LINK32 libdb41d.lib /nologo /dll /debug /machine:I386 /out:"Debug/freeze12d.dll" /implib:"Debug/freezed.lib" /libpath:"../../../lib"
# SUBTRACT LINK32 /pdb:none /nodefaultlib
# Begin Special Build Tool
OutDir=.\Debug
SOURCE="$(InputPath)"
PostBuild_Cmds=copy $(OutDir)\freezed.lib ..\..\lib	copy $(OutDir)\freeze12d.pdb ..\..\bin	copy $(OutDir)\freeze12d.dll ..\..\bin
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "Freeze - Win32 Release"
# Name "Freeze - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\DB.cpp
# End Source File
# Begin Source File

SOURCE=.\Exception.cpp
# End Source File
# Begin Source File

SOURCE=.\Connection.cpp
# End Source File
# Begin Source File

SOURCE=.\ConnectionF.cpp
# End Source File
# Begin Source File

SOURCE=.\Transaction.cpp
# End Source File
# Begin Source File

SOURCE=.\Evictor.cpp
# End Source File
# Begin Source File

SOURCE=.\EvictorI.cpp
# End Source File
# Begin Source File

SOURCE=.\EvictorIteratorI.cpp
# End Source File
# Begin Source File

SOURCE=.\Util.cpp
# End Source File
# Begin Source File

SOURCE=.\Index.cpp
# End Source File
# Begin Source File

SOURCE=.\IndexI.cpp
# End Source File
# Begin Source File

SOURCE=.\MapI.cpp
# End Source File
# Begin Source File

SOURCE=.\ConnectionI.cpp
# End Source File
# Begin Source File

SOURCE=.\TransactionHolder.cpp
# End Source File
# Begin Source File

SOURCE=.\TransactionI.cpp
# End Source File
# Begin Source File

SOURCE=.\SharedDb.cpp
# End Source File
# Begin Source File

SOURCE=.\EvictorStorage.cpp
# End Source File
# Begin Source File

SOURCE=.\SharedDbEnv.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\..\include\Freeze\Application.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\DB.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Exception.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Connection.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\ConnectionF.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Transaction.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\TransactionHolder.h
# End Source File
# Begin Source File

SOURCE=.\TransactionI.h
# End Source File
# Begin Source File

SOURCE=.\ConnectionI.h
# End Source File
# Begin Source File

SOURCE=.\MapI.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Evictor.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\EvictorF.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Index.h
# End Source File
# Begin Source File

SOURCE=.\EvictorI.h
# End Source File
# Begin Source File

SOURCE=.\EvictorIteratorI.h
# End Source File
# Begin Source File

SOURCE=.\Util.h
# End Source File
# Begin Source File

SOURCE=.\IndexI.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Freeze.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Initialize.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\Map.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Freeze\EvictorStorage.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=..\..\slice\Freeze\DB.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__DB_IC="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\DB.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/DB.ice \
	move DB.h ..\..\include\Freeze \
	

"..\..\include\Freeze\DB.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"DB.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__DB_IC="..\..\bin\slice2cpp.exe"	"..\..\lib\sliced.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\DB.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/DB.ice \
	move DB.h ..\..\include\Freeze \
	

"..\..\include\Freeze\DB.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"DB.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\slice\Freeze\Exception.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Exception.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Exception.ice \
	move Exception.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Exception.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Exception.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Exception.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Exception.ice \
	move Exception.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Exception.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Exception.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\slice\Freeze\Connection.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Connection.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Connection.ice \
	move Connection.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Connection.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Connection.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Connection.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Connection.ice \
	move Connection.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Connection.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Connection.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\slice\Freeze\ConnectionF.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\ConnectionF.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/ConnectionF.ice \
	move ConnectionF.h ..\..\include\Freeze \
	

"..\..\include\Freeze\ConnectionF.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"ConnectionF.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\ConnectionF.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/ConnectionF.ice \
	move ConnectionF.h ..\..\include\Freeze \
	

"..\..\include\Freeze\ConnectionF.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"ConnectionF.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\slice\Freeze\Transaction.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Transaction.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Transaction.ice \
	move Transaction.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Transaction.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Transaction.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__DBEXC="..\..\bin\slice2cpp.exe"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Transaction.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Transaction.ice \
	move Transaction.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Transaction.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Transaction.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\slice\Freeze\Evictor.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__EVICT="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Evictor.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Evictor.ice \
	move Evictor.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Evictor.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Evictor.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__EVICT="..\..\bin\slice2cpp.exe"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\Evictor.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/Evictor.ice \
	move Evictor.h ..\..\include\Freeze \
	

"..\..\include\Freeze\Evictor.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"Evictor.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\slice\Freeze\EvictorF.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__EVICTO="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\EvictorF.ice

"..\..\include\Freeze\EvictorF.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/EvictorF.ice 
	move EvictorF.h ..\..\include\Freeze 
	del EvictorF.cpp 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__EVICTO="..\..\bin\slice2cpp.exe"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\EvictorF.ice

"..\..\include\Freeze\EvictorF.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/EvictorF.ice 
	move EvictorF.h ..\..\include\Freeze 
	del EvictorF.cpp 
	
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\..\slice\Freeze\EvictorStorage.ice

!IF  "$(CFG)" == "Freeze - Win32 Release"

USERDEP__EVICTOR="..\..\bin\slice2cpp.exe"	"..\..\lib\slice.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\EvictorStorage.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/EvictorStorage.ice \
	move EvictorStorage.h ..\..\include\Freeze \
	

"..\..\include\Freeze\EvictorStorage.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"EvictorStorage.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Freeze - Win32 Debug"

USERDEP__EVICTOR="..\..\bin\slice2cpp.exe"	"..\..\lib\sliced.lib"	
# Begin Custom Build
InputPath=..\..\slice\Freeze\EvictorStorage.ice

BuildCmds= \
	..\..\bin\slice2cpp.exe --dll-export FREEZE_API --include-dir Freeze -I../../slice ../../slice/Freeze/EvictorStorage.ice \
	move EvictorStorage.h ..\..\include\Freeze \
	

"..\..\include\Freeze\EvictorStorage.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"EvictorStorage.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# End Group
# End Target
# End Project