// **********************************************************************
//
// Copyright (c) 2003-2011 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef TEST_ICE
#define TEST_ICE

#include <Ice/BuiltinSequences.ice>

[["java:package:test.Ice.dispatcher"]]
module Test
{

interface TestIntf
{
    void op();
    void opWithPayload(Ice::ByteSeq seq);
    void shutdown();
};

interface TestIntfController
{
    void holdAdapter();
    void resumeAdapter();
};

};

#endif
