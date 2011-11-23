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

#ifndef ICE_OBJECT_ADAPTER_ICE
#define ICE_OBJECT_ADAPTER_ICE

#include <Ice/CommunicatorF.ice>
#include <Ice/ServantLocatorF.ice>
#include <Ice/RouterF.ice>
#include <Ice/LocatorF.ice>
#include <Ice/Identity.ice>

module Ice
{

/**
 *
 * The object adapter, which is responsible for receiving requests
 * from endpoints, and for mapping between servants, identities, and
 * proxies.
 *
 * @see Communicator
 * @see ServantLocator
 *
 **/
local interface ObjectAdapter
{
    /**
     *
     * Get the name of this object adapter.
     *
     * @return This object adapter's name.
     *
     **/
    string getName();

    /**
     *
     * Get the communicator this object adapter belongs to.
     *
     * @return This object adapter's communicator.
     *
     * @see Communicator
     *
     **/
    Communicator getCommunicator();

    /**
     *
     * Activate all endpoints that belong to this object
     * adapter. After activation, the object adapter can dispatch
     * requests received through its endpoints.
     *
     * @see hold
     * @see deactivate
     *
     **/
    void activate();

    /**
     *
     * Temporarily hold receiving and dispatching requests. The object
     * adapter can be reactivated with the [activate] operation.
     *
     * <note><para> Holding is not immediate, i.e., after [hold]
     * returns, the object adapter might still be active for some
     * time. You can use [waitForHold] to wait until holding is
     * complete. </para></note>
     *
     * @see activate
     * @see deactivate
     * @see waitForHold
     *
     **/
    void hold();

    /**
     *
     * Wait until the object adapter holds requests. Calling [hold]
     * initiates holding of requests, and [waitForHold] only returns
     * when holding of requests has been completed.
     *
     * @see hold
     * @see waitForDeactivate
     * @see Communicator::waitForShutdown
     *
     **/
    void waitForHold();

    /**
     *
     * Deactivate all endpoints that belong to this object
     * adapter. After deactivation, the object adapter stops receiving
     * requests through its endpoints. Object adapters that have been
     * deactivated must not be reactivated again, i.e., the
     * deactivation is permanent and [activate] or [hold] must not be
     * called after calling [deactivate]; attempting to do so results
     * in an [ObjectAdapterDeactivatedException] being thrown. Calls
     * to [deactivate] on an already deactivated object adapter are
     * ignored.
     *
     * <note><para> After [deactivate] returns, no new requests are
     * processed by the object adapter. However, requests that have
     * been started before [deactivate] was called might still be
     * active. You can use [waitForDeactivate] to wait for the
     * completion of all requests for this object
     * adapter. </para></note>
     *
     * @see activate
     * @see hold
     * @see waitForDeactivate
     * @see Communicator::shutdown
     *
     **/
    void deactivate();

    /**
     *
     * Wait until the object adapter has deactivated. Calling
     * [deactivate] initiates object adapter deactivation, and
     * [waitForDeactivate] only returns when deactivation has
     * been completed.
     *
     * @see deactivate
     * @see waitForHold
     * @see Communicator::waitForShutdown
     *
     **/
    void waitForDeactivate();

    /**
     *
     * Add a servant to this object adapter's Active Servant Map. Note
     * that one servant can implement several &Ice; objects by
     * registering the servant with multiple identities. Adding a
     * servant with an identity that is in the map already throws
     * [AlreadyRegisteredException].
     *
     * @param servant The servant to add.
     *
     * @param id The identity of the &Ice; object that is
     * implemented by the servant.
     *
     * @return A proxy that matches the given identity and this object
     * adapter.
     *
     * @see Identity
     * @see addWithUUID
     * @see remove
     *
     **/
    Object* add(Object servant, Identity id);

    /**
     *
     * Add a servant to this object adapter's Active Servant Map,
     * using an automatically generated UUID as its identity. Note that
     * the generated UUID identity can be accessed using the proxy's
     * [ice_getIdentity] operation.
     *
     * @param servant The servant to add.
     *
     * @return A proxy that matches the generated UUID identity and
     * this object adapter.
     *
     * @see Identity
     * @see add
     * @see remove
     *
     **/
    Object* addWithUUID(Object servant);

    /**
     *
     * Remove a servant from the object adapter's Active Servant Map.
     *
     * @param id The identity of the &Ice; object that is
     * implemented by the servant. If the servant implements multiple
     * &Ice; objects, [remove] has to be called for all those &Ice;
     * objects. Removing an identity that is not in the map throws
     * [NotRegisteredException].
     *
     * @see Identity
     * @see add
     * @see addWithUUID
     *
     **/
    void remove(Identity id);

    /**
     *
     * Add a Servant Locator to this object adapter. Adding a servant
     * locator for a category for which a servant locator is already
     * registered throws [AlreadyRegisteredException]. To dispatch
     * operation calls on servants, the object adapter tries to find a
     * servant for a given &Ice; object identity in the following order:
     *
     * <orderedlist>
     *
     * <listitem><para>The object adapter tries to find a servant for
     * the identity in the Active Servant Map.</para></listitem>
     *
     * <listitem><para>If no servant has been found in the Active
     * Servant Map, the object adapter tries to find a locator for the
     * category component of the identity. If a locator is found, the
     * object adapter tries to find a servant using this
     * locator.</para></listitem>
     *
     * <listitem><para>If no servant has been found by any of the
     * preceding steps, the object adapter tries to find a locator for
     * an empty category, regardless of the category contained in the
     * identity. If a locator is found, the object adapter tries to
     * find a servant using this locator.</para></listitem>
     *
     * <listitem><para>If no servant has been found with any of the
     * preceding steps, the object adapter gives up and the caller
     * receives [ObjectNotExistException].</para></listitem>
     *
     * </orderedlist>
     *
     * <note><para>Only one locator for the empty category can be
     * installed.</para></note>
     *
     * @param locator The locator to add.
     *
     * @param category The category for which the Servant Locator can
     * locate servants, or an empty string if the Servant Locator does
     * not belong to any specific category.
     *
     * @see Identity
     * @see findServantLocator
     * @see ServantLocator
     *
     **/
    void addServantLocator(ServantLocator locator, string category);

    /**
     *
     * Find a Servant Locator installed with this object adapter.
     *
     * @param category The category for which the Servant Locator can
     * locate servants, or an empty string if the Servant Locator does
     * not belong to any specific category.
     *
     * @return The Servant Locator, or null if no Servant Locator was
     * found for the given category.
     *
     * @see Identity
     * @see addServantLocator
     * @see ServantLocator
     *
     **/
    ServantLocator findServantLocator(string category);

    /**
     *
     * Look up a servant in this object adapter's Active Servant Map
     * by the identity of the &Ice; object it implements.
     *
     * <note><para>This operation only tries to lookup a servant in
     * the Active Servant Map. It does not attempt to find a servant
     * by using any installed [ServantLocator].</para></note>
     *
     * @param id The identity of the &Ice; object for which the
     * servant should be returned.
     *
     * @return The servant that implements the &Ice; object with the
     * given identity, or null if no such servant has been found.
     *
     * @see Identity
     * @see proxyToServant
     *
     **/
    Object identityToServant(Identity id);

    /**
     *
     * Look up a servant in this object adapter's Active Servant Map,
     * given a proxy.
     *
     * <note><para>This operation only tries to lookup a servant in
     * the Active Servant Map. It does not attempt to find a servant
     * via any installed [ServantLocator]s.</para></note>
     *
     * @param proxy The proxy for which the servant should be returned.
     *
     * @return The servant that matches the proxy, or null if no such
     * servant has been found.
     *
     * see identityToServant
     *
     **/
    Object proxyToServant(Object* proxy);

    /**
     *
     * Create a proxy that matches this object adapter and the given
     * identity.
     *
     * @param id The identity for which a proxy is to be created.
     *
     * @return A proxy that matches the given identity and this object
     * adapter.
     *
     * @see Identity
     *
     **/
    Object* createProxy(Identity id);

    /**
     *
     * Create a "direct proxy" that matches this object adapter and
     * the given identity. A direct proxy always contains the current
     * adapter endpoints.
     *
     * <note><para> This operation is intended to be used by locator
     * implementations. Regular user code should not attempt to use
     * this operation.</para></note>
     *
     * @param id The identity for which a proxy is to be created.
     *
     * @return A proxy that matches the given identity and this object
     * adapter.
     *
     * @see Identity
     *
     **/
    Object* createDirectProxy(Identity id);

    /**
     *
     * Create a "reverse proxy" that matches this object adapter and
     * the given identity. A reverse proxy uses connections that have
     * been established from a client to this object adapter.
     *
     * <note><para> Like the [Router] interface, this operation is
     * intended to be used by router implementations. Regular user
     * code should not attempt to use this operation.
     * </para></note>
     *
     * @param id The identity for which a proxy is to be created.
     *
     * @return A "reverse proxy" that matches the given identity and
     * this object adapter.
     *
     * @see Identity
     *
     **/
    Object* createReverseProxy(Identity id);

    /**
     *
     * Add a router to this object adapter. By doing so,
     * this object adapter can receive callbacks from this router
     * over connections that are established from this process to
     * the router. This avoids the need for the router to establish
     * a separate connection back to this object adapter.
     *
     * <note><para> You can add a particular router to only a single
     * object adapter. Adding the same router to more than one object adapter
     * results in undefined behavior. However, it is possible to
     * add different routers to different object
     * adapters. </para></note>
     *
     * @param rtr The router to add to this object adapter.
     *
     * @see Router
     * @see Communicator::setDefaultRouter
     *
     **/
    void addRouter(Router* rtr);

    /**
     * Set an &Ice; locator for this object adapter. By doing so, the
     * object adapter will register itself with the locator registry
     * when it is activated for the first time. Furthermore, the proxies
     * created by this object adapter will contain the adapter name instead
     * of its endpoints.
     *
     * @param loc The locator used by this object adapter.
     *
     * @see createDirectProxy
     * @see Locator
     * @see LocatorRegistry
     * 
     **/
    void setLocator(Locator* loc);
};

};

#endif