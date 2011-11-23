// **********************************************************************
//
// Copyright (c) 2003
// ZeroC, Inc.
// Billerica, MA, USA
//
// All Rights Reserved.
//
// Ice is free software; you can redistribute it and/or modify it under
// the terms of the GNU General Public License version 2 as published by
// the Free Software Foundation.
//
// **********************************************************************

#ifndef ICE_CONNECTOR_F_H
#define ICE_CONNECTOR_F_H

#include <Ice/Handle.h>

namespace IceInternal
{

class Connector;
ICE_PROTOCOL_API void incRef(Connector*);
ICE_PROTOCOL_API void decRef(Connector*);
typedef Handle<Connector> ConnectorPtr;

}

#endif