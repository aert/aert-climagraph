
.. _uc1-2-4:

uc1.2.4: Delete PDP
*******************

Actors
------

#. User

Preconditions
-------------

1. User is authenticated.
2. An existing ``PDP`` has been selected.

Post-conditions
---------------

1. Selected ``PDP`` is removed from database.
2. All ``CDP`` are invalidated.

Normal flow
-----------

1. The user launches this use case.
2. The system displays the following confirmation message:

   | Do you really want to remove this location Data Point ?

   :Delete: Deletes selected location.

3. The user launches ``Delete`` action.
4. The system deletes selected ``PDP``.
5. The system invalidates all ``CDPs``.

Alternate flows
---------------

4a. Input data is invalid :

    4.a.1. The system goes back to ``step 2`` adding error informations.

Business Rules
--------------

See :ref:`uc1-2-1-rules`.


