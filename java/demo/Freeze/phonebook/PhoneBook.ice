// **********************************************************************
//
// Copyright (c) 2003-2011 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef PHONE_BOOK_ICE
#define PHONE_BOOK_ICE

#include <Ice/Identity.ice>

module Demo
{

exception DatabaseException
{
    string message;
};

class Contact
{
    idempotent string getName();
    ["freeze:write"] idempotent void setName(string name) throws DatabaseException;

    idempotent string getAddress();
    ["freeze:write"] idempotent void setAddress(string address);

    idempotent string getPhone();
    ["freeze:write"] idempotent void setPhone(string phone);

    ["freeze:write"] void destroy() throws DatabaseException;

    string name;
    string address;
    string phone;
};

sequence<Contact*> Contacts;

interface PhoneBook
{
    Contact* createContact() throws DatabaseException;
    idempotent Contacts findContacts(string name) throws DatabaseException;
    void setEvictorSize(int size) throws DatabaseException;
    void shutdown();
};

};

#endif
