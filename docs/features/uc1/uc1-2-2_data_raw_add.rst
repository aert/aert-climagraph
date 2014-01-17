
.. _uc1-2-2:

uc1.2.2: Add PDP
****************

Actors
------

#. User

Preconditions
-------------

1. User is authenticated.

Post-conditions
---------------

1. New ``PDP`` is added with correct informations.
2. All ``CDP`` are invalidated.

Normal flow
-----------

1. The user launches this use case.
2. The system displays the following input form:

   **Data:**     

   :DataPoint Type: Kind of data, *ex.: Wind, Rain, Rice Production, etc.* - ``foreign key``
   :Location:       Location of the sample, ``rule 1`` - ``label``
   :Date Sampled:   Date of the sample - ``date``
   :Timeslot:       Timeslot for the sampling in seconds - ``long``
   :Value:          measurement reported - ``double, nullable``

   **Actions:**

   :Add: Creates the new ``PDP``.

3. The user launches ``Add`` action.
4. The system creates the new ``PDP``.
5. The system invalidates all ``CDP``.

Alternate flows
---------------

4a. Input data is invalid :

    4.a.1. The system goes back to ``step 2`` adding error informations.

Business Rules
--------------

See :ref:`uc1-2-1-rules`.

:rule 1:
  The ``Location`` field should be the most precise available one.

