
.. _uc1-2-3:

uc1.2.3: Update PDP
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

1. Selected ``PDP``'s data is updated accordingly to modifications done.
2. All ``CDPs`` are invalidated if necessary.

Normal flow
-----------

1. The user launches this use case.
2. The system displays the following prepopulated non modifiable data:

   :DataPoint Type: Kind of data - ``foreign key``
   :Location:       Location of the sample - ``label``
   :Date Sampled:   Date of the sample - ``date``
   :Timeslot:       Timeslot for the sampling in seconds - ``long``

3. The system displays the following **prepopulated** input form:

   **Data:**     

   :Value: measurement reported - ``double, nullable``

   **Actions:**

   :Update: Updates selected location.

4. The user launches ``Update`` action.
5. The system updates selected ``PDP``.
6. The system invalidates all ``CDPs``.

Alternate flows
---------------

4a. Input data is invalid :

    4.a.1. The system goes back to ``step 2`` adding error informations.

Business Rules
--------------

See :ref:`uc1-2-1-rules`.

