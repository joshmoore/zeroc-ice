#!/usr/bin/env python
# **********************************************************************
#
# Copyright (c) 2003
# ZeroC, Inc.
# Billerica, MA, USA
#
# All Rights Reserved.
#
# Ice is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 as published by
# the Free Software Foundation.
#
# **********************************************************************

import os, sys, re

for toplevel in [".", "..", "../..", "../../..", "../../../.."]:
    toplevel = os.path.normpath(toplevel)
    if os.path.exists(os.path.join(toplevel, "config", "TestUtil.py")):
        break
else:
    raise "can't find toplevel directory!"

sys.path.append(os.path.join(toplevel, "config"))
import TestUtil

directory = os.path.join(toplevel, "test", "Transform", "evictor")
transformdb = os.path.join(toplevel, "bin", "transformdb")

dbdir = os.path.join(directory, "db")
TestUtil.cleanDbDir(dbdir)

print "testing evictor transformations... ",
sys.stdout.flush()

makedb = os.path.join(directory, "makedb") + " " + directory
os.system(makedb)

testold = os.path.join(directory, "TestOld.ice")
testnew = os.path.join(directory, "TestNew.ice")
transformxml = os.path.join(directory, "transform.xml")
checkxml = os.path.join(directory, "check.xml")

command = transformdb + " -p --old " + testold + " --new " + testnew + " -f " + transformxml + " " + dbdir + " evictor.db check.db"
stdin, stdout, stderr = os.popen3(command)
stderr.readlines()

command = transformdb + " --old " + testnew + " --new " + testnew + " -f " + checkxml + " " + dbdir + " check.db tmp.db"
os.system(command)

print "ok"

sys.exit(0)