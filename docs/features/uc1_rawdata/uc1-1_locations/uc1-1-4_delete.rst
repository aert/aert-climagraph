
.. _uc1-1-4:

uc1.1.4: Delete Location
************************

Actors
------

#. User

Preconditions
-------------

1. User is authenticated.
2. An existing location has been selected.
3. Selected location must have no child location.
4. Selected location must have no ``PDP`` attached.

Post-conditions
---------------

1. Selected location is removed from database.
2. All ``CDP`` are invalidated.

Normal flow
-----------

1. The user launches this use case.
2. The system displays the following confirmation message:

   | Do you really want to remove this location : **<Name>** ?

   **Data:**     

   :Name: Location name.

   **Actions:**

   :Delete: Deletes selected location.

3. The user launches ``Delete`` action.
4. The system deletes all ``PDP`` linked to current location.
5. The system deletes selected location.
6. The system invalidates all ``CDP``.

Alternate flows
---------------

4a. Input data is invalid :

    4.a.1. The system goes back to ``step 2`` adding error informations.

Business Rules
--------------

See :ref:`uc1-1-1-rules`.

