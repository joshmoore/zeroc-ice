// **********************************************************************
//
// Copyright (c) 2003-2011 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

package Freeze;

interface PostCompletionCallback
{
    void postCompletion(boolean committed, boolean deadlock, SharedDbEnv dbEnv);
}
