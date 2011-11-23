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

#include <Ice/Ice.h>
#include <Ice/BuiltinSequences.h>
#include <ServerLocator.h>

using namespace std;

ServerLocatorRegistry::ServerLocatorRegistry()
{
}

void 
ServerLocatorRegistry::setAdapterDirectProxy(const ::std::string& adapter, const ::Ice::ObjectPrx& object, 
					     const ::Ice::Current&)
{
    _adapters[adapter] = object;
}

Ice::ObjectPrx
ServerLocatorRegistry::getAdapter(const ::std::string& adapter) const
{
    ::std::map< string, ::Ice::ObjectPrx>::const_iterator p = _adapters.find(adapter);
    if(_adapters.find(adapter) == _adapters.end())
    {
	throw Ice::AdapterNotFoundException();
    }
    return p->second;
}

Ice::ObjectPrx
ServerLocatorRegistry::getObject(const ::Ice::Identity& id) const
{
    ::std::map< ::Ice::Identity, ::Ice::ObjectPrx>::const_iterator p = _objects.find(id);
    if(p == _objects.end())
    {
	throw Ice::ObjectNotFoundException();
    }

    return p->second;
}

void
ServerLocatorRegistry::addObject(const Ice::ObjectPrx& object)
{
    _objects[object->ice_getIdentity()] = object;
}

ServerLocator::ServerLocator(const ServerLocatorRegistryPtr& registry, const ::Ice::LocatorRegistryPrx& registryPrx) :
    _registry(registry),
    _registryPrx(registryPrx)
{
}

void
ServerLocator::findObjectById_async(const Ice::AMD_Locator_findObjectByIdPtr& response, const Ice::Identity& id, 
				    const Ice::Current& current) const
{
    response->ice_response(_registry->getObject(id));
}

void
ServerLocator::findAdapterById_async(const Ice::AMD_Locator_findAdapterByIdPtr& response, const string& id, 
				     const Ice::Current& current) const
{
    response->ice_response(_registry->getAdapter(id));
}

Ice::LocatorRegistryPrx
ServerLocator::getRegistry(const ::Ice::Current&) const
{
    return _registryPrx;
}
