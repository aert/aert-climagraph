
.. _uc1-1-3:

uc1.1.3: Update Location
************************

Actors
------

#. User

Preconditions
-------------

1. User is authenticated.
2. An existing location has been selected.

Post-conditions
---------------

1. Selected location's data is updated accordingly to modifications done.
2. All ``CDP`` are invalidated if necessary.

Normal flow
-----------

1. The user launches this use case.
2. The system displays the following **prepopulated** input form:

   **Data:**     

   :Name: Location name, ``rule 1``  - ``char(100)``.
   :Description: Description - ``char(500)``.
   :Latitude: Geospacial latitude - ``double``.
   :Longitude: Geospacial longitude - ``double``.
   :Geometry: List of geospacial points delimiting an area - ``text``.
   :Parents: List of parent locations, ``rule 2``  - ``foreign keys``.

   **Actions:**

   :Update: Updates selected location.

3. The user launches ``Update`` action.
4. The system updates selected location.
5. The system invalidates all ``CDP`` if ``Parents`` fields has been modified.

Alternate flows
---------------

4a. Input data is invalid :

    4.a.1. The system goes back to ``step 2`` adding error informations.

Business Rules
--------------

See :ref:`uc1-1-1-rules`.

