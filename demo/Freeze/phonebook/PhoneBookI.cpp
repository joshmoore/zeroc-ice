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

#include <PhoneBookI.h>
#include <IceUtil/UUID.h>

using namespace std;
using namespace Ice;

ContactI::ContactI(const Freeze::EvictorPtr& evictor) :
    _evictor(evictor)
{
}

string
ContactI::getName(const Ice::Current&) const
{
    IceUtil::RWRecMutex::RLock sync(*this);
    return name;
}

void
ContactI::setName(const string& newName, const Ice::Current&)
{
    IceUtil::RWRecMutex::WLock sync(*this);
    name = newName;
}

string
ContactI::getAddress(const Ice::Current&) const
{
    IceUtil::RWRecMutex::RLock sync(*this);
    return address;
}

void
ContactI::setAddress(const string& newAddress, const Ice::Current&)
{
    IceUtil::RWRecMutex::WLock sync(*this);
    address = newAddress;
}

string
ContactI::getPhone(const Ice::Current&) const
{
    IceUtil::RWRecMutex::RLock sync(*this);
    return phone;
}

void
ContactI::setPhone(const string& newPhone, const Ice::Current&)
{
    IceUtil::RWRecMutex::WLock sync(*this);
    phone = newPhone;
}

void
ContactI::destroy(const Ice::Current& c)
{
    IceUtil::RWRecMutex::RLock sync(*this);
    try
    {
	_evictor->destroyObject(c.id);
    }
    catch(const Freeze::DatabaseException& ex)
    {
	DatabaseException e;
	e.message = ex.message;
	throw e;
    }
}

PhoneBookI::PhoneBookI(const Freeze::EvictorPtr& evictor, const NameIndexPtr& index) :
    _evictor(evictor),
    _index(index)
{
}

class IdentityToContact
{
public:

    IdentityToContact(const ObjectAdapterPtr& adapter) :
	_adapter(adapter)
    {
    }

    ContactPrx operator()(const Identity& ident)
    {
	return ContactPrx::uncheckedCast(_adapter->createProxy(ident));
    }

private:

    ObjectAdapterPtr _adapter;
};

ContactPrx
PhoneBookI::createContact(const Ice::Current& c)
{
    //
    // Get a new unique identity.
    //
    Identity ident;
    ident.name = IceUtil::generateUUID();
    ident.category = "contact";

    //
    // Create a new Contact Servant.
    //
    ContactIPtr contact = new ContactI(_evictor);
    
    //
    // Create a new Ice Object in the evictor, using the new identity
    // and the new Servant.
    //
    _evictor->createObject(ident, contact);

    
    //
    // Turn the identity into a Proxy and return the Proxy to the
    // caller.
    //
    return IdentityToContact(c.adapter)(ident);
}

Contacts
PhoneBookI::findContacts(const string& name, const Ice::Current& c) const
{
    try
    {
	vector<Identity> identities = _index->find(name);
	
	Contacts contacts;
	contacts.reserve(identities.size());
	transform(identities.begin(), identities.end(), back_inserter(contacts), IdentityToContact(c.adapter));

	return contacts;
    }
    catch(const Freeze::DatabaseException& ex)
    {
	DatabaseException e;
	e.message = ex.message;
	throw e;
    }
}

void
PhoneBookI::setEvictorSize(Int size, const Ice::Current&)
{
    _evictor->setSize(size);
}

void
PhoneBookI::shutdown(const Ice::Current& c) const
{
    c.adapter->getCommunicator()->shutdown();
}
