#!/usr/bin/env python
# -*- coding: utf-8 -*-
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

#
# Write config
#
configPath = u"./config/中国_client.config"

TestUtil.createConfig(configPath, 
                      ["# Automatically generated by Ice test driver.", 
                       "Ice.Trace.Protocol=1",
                       "Ice.Trace.Network=1", 
                       "Ice.ProgramName=PropertiesClient", 
                       "Config.Path=./config/中国_client.config"])
                       
TestUtil.simpleTest()

if os.path.exists(configPath):
    os.remove(configPath)

