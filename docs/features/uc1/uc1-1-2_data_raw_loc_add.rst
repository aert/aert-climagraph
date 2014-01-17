
.. _uc1-1-2:

uc1.1.2: Add Location
*********************

Actors
------

#. User

Preconditions
-------------

1. User is authenticated.

Post-conditions
---------------

1. New location is added with correct informations.
2. All ``CDP`` are invalidated.

Normal flow
-----------

1. The user launches this use case.
2. The system displays the following input form:

   **Data:**     

   :Name: Location name, ``rule 1``  - ``char(100)``.
   :Description: Description - ``char(500)``.
   :Latitude: Geospacial latitude - ``double``.
   :Longitude: Geospacial longitude - ``double``.
   :Geometry: List of geospacial points delimiting an area - ``text``.
   :Parents: List of parent locations, ``rule 2``  - ``foreign keys``.

   **Actions:**

   :Submit: Creates the new location.

3. The user launches ``Submit`` action.
4. The system creates the new location.
5. The system invalidates all ``CDP``.

Alternate flows
---------------

4a. Input data is invalid :

    4.a.1. The system goes back to ``step 2`` adding error informations.

Business Rules
--------------

See :ref:`uc1-1-1-rules`.

