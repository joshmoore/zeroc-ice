// **********************************************************************
//
// Copyright (c) 2003-2009 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef ICE_UTIL_SHARED_H
#define ICE_UTIL_SHARED_H

#include <IceUtil/Config.h>

#if defined(ICE_USE_MUTEX_SHARED)
#   include <IceUtil/Mutex.h>

#elif (defined(__APPLE__) || defined(__linux) || defined(__FreeBSD__)) && (defined(__i386) || defined(__x86_64)) && !defined(__ICC)
#   define ICE_HAS_ATOMIC_FUNCTIONS

#elif defined(_WIN32)
// Nothing to include
#else
// Use a simple mutex
#   include <IceUtil/Mutex.h>
#endif

//
// Base classes for reference counted types. The IceUtil::Handle
// template can be used for smart pointers to types derived from these
// bases.
//
// IceUtil::SimpleShared
// =====================
//
// A non thread-safe base class for reference-counted types.
//
// IceUtil::Shared
// ===============
//
// A thread-safe base class for reference-counted types.
//
namespace IceUtil
{

class ICE_UTIL_API SimpleShared
{
public:

    SimpleShared();
    SimpleShared(const SimpleShared&);

    virtual ~SimpleShared()
    {
    }

    SimpleShared& operator=(const SimpleShared&)
    {
        return *this;
    }

    void __incRef()
    {
        assert(_ref >= 0);
        ++_ref;
    }

    void __decRef()
    {
        assert(_ref > 0);
        if(--_ref == 0)
        {
            if(!_noDelete)
            {
                _noDelete = true;
                delete this;
            }
        }
    }

    int __getRef() const
    {
        return _ref;
    }

    void __setNoDelete(bool b)
    {
        _noDelete = b;
    }

private:

    int _ref;
    bool _noDelete;
};

class ICE_UTIL_API Shared
{
public:

    Shared();
    Shared(const Shared&);

    virtual ~Shared()
    {
    }

    Shared& operator=(const Shared&)
    {
        return *this;
    }

    virtual void __incRef();
    virtual void __decRef();
    virtual int __getRef() const;
    virtual void __setNoDelete(bool);

protected:

#if defined(_WIN32)
    LONG _ref;
#elif defined(ICE_HAS_ATOMIC_FUNCTIONS)
    volatile int _ref;
#else
    int _ref;
    Mutex _mutex;
#endif
    bool _noDelete;
};

}

#endif