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

#include <IcePack/AdapterRegistryI.h>
#include <IcePack/TraceLevels.h>
#include <Freeze/Initialize.h>

using namespace std;
using namespace IcePack;

IcePack::AdapterRegistryI::AdapterRegistryI(const Ice::CommunicatorPtr& communicator,
					    const string& envName, const string& dbName,
					    const TraceLevelsPtr& traceLevels) :
    _connectionCache(Freeze::createConnection(communicator, envName)),
    _dictCache(_connectionCache, dbName),
    _traceLevels(traceLevels),
    _envName(envName),
    _communicator(communicator),
    _dbName(dbName)
{
}

void
IcePack::AdapterRegistryI::add(const string& id, const AdapterPrx& adapter, const Ice::Current&)
{
    Freeze::ConnectionPtr connection = Freeze::createConnection(_communicator, _envName);
    StringObjectProxyDict dict(connection, _dbName); 

    StringObjectProxyDict::iterator p = dict.find(id);
    if(p != dict.end())
    {
	try
	{
	    p->second->ice_ping();
	}
	catch(const Ice::ObjectNotExistException&)
	{
	    p.set(adapter);

	    if(_traceLevels->adapterRegistry > 0)
	    {
		Ice::Trace out(_traceLevels->logger, _traceLevels->adapterRegistryCat);
		out << "added adapter `" << id << "'";
	    }

	    return;
	}
	catch(const Ice::LocalException&)
	{
	}
	throw AdapterExistsException();
    }
    dict.put(pair<const string, const Ice::ObjectPrx>(id, adapter));

    if(_traceLevels->adapterRegistry > 0)
    {
	Ice::Trace out(_traceLevels->logger, _traceLevels->adapterRegistryCat);
	out << "added adapter `" << id << "'";
    }
}

void
IcePack::AdapterRegistryI::remove(const string& id, const Ice::Current&)
{
    Freeze::ConnectionPtr connection = Freeze::createConnection(_communicator, _envName);
    StringObjectProxyDict dict(connection, _dbName); 

    StringObjectProxyDict::iterator p = dict.find(id);
    if(p == dict.end())
    {
	throw AdapterNotExistException();
    }
    
    dict.erase(p);

    if(_traceLevels->adapterRegistry > 0)
    {
	Ice::Trace out(_traceLevels->logger, _traceLevels->adapterRegistryCat);
	out << "removed adapter `" << id << "'";
    }
}

AdapterPrx
IcePack::AdapterRegistryI::findById(const string& id, const Ice::Current&)
{
    Freeze::ConnectionPtr connection = Freeze::createConnection(_communicator, _envName);
    StringObjectProxyDict dict(connection, _dbName); 

    StringObjectProxyDict::iterator p = dict.find(id);
    if(p != dict.end())
    {
	try
	{
	    return AdapterPrx::checkedCast(p->second->ice_collocationOptimization(false));
	}
	catch(const Ice::ObjectNotExistException&)
	{
	    dict.erase(p);
	}
	catch(const Ice::LocalException&)
	{
	    return AdapterPrx::uncheckedCast(p->second->ice_collocationOptimization(false));
	}
    }
    throw AdapterNotExistException();
}

Ice::StringSeq
IcePack::AdapterRegistryI::getAll(const Ice::Current&) const
{
    Freeze::ConnectionPtr connection = Freeze::createConnection(_communicator, _envName);
    StringObjectProxyDict dict(connection, _dbName); 

    Ice::StringSeq ids;
    ids.reserve(dict.size());

    for(StringObjectProxyDict::const_iterator p = dict.begin(); p != dict.end(); ++p)
    {
	ids.push_back(p->first);
    }

    return ids;
}