#!/usr/bin/env python
# **********************************************************************
#
# Copyright (c) 2003-2011 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

import os, sys

path = [ ".", "..", "../..", "../../..", "../../../.." ]
head = os.path.dirname(sys.argv[0])
if len(head) > 0:
    path = [os.path.join(head, p) for p in path]
path = [os.path.abspath(p) for p in path if os.path.exists(os.path.join(p, "scripts", "TestUtil.py")) ]
if len(path) == 0:
    raise "can't find toplevel directory!"
sys.path.append(os.path.join(path[0]))
from scripts import *

router = os.path.join(TestUtil.getCppBinDir(), "glacier2router")

args =  ' --Ice.Warn.Dispatch=0' + \
        ' --Ice.Warn.Connections=0' + \
        ' --Glacier2.SessionTimeout="30"' + \
        ' --Glacier2.Client.Endpoints="default -p 12347"' + \
        ' --Glacier2.Server.Endpoints="tcp -h 127.0.0.1"' \
        ' --Ice.Admin.Endpoints="tcp -h 127.0.0.1 -p 12348"' + \
        ' --Ice.Admin.InstanceName=Glacier2' + \
        ' --Glacier2.CryptPasswords="' + os.path.join(os.getcwd(), "passwords") + '"'

print "starting router...",
routerConfig = TestUtil.DriverConfig("server")
routerConfig.lang = "cpp"
starterProc = TestUtil.startServer(router, args, count=2, config=routerConfig)
print "ok"



TestUtil.clientServerTest(additionalClientOptions=" --shutdown")

starterProc.waitTestSuccess()

