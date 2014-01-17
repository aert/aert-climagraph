
.. _uc1-1-1:

uc1.1.1: List Locations
***********************

Actors
------

#. User

Preconditions
-------------

1. User is authenticated

Post-conditions
---------------

1. Locations are listed

Normal flow
-----------

1. The user launches this use case.
2. The system displays the locations list.
   Each row contains : 

   **Data:**     

   :Name: Location name, ``rule 1``  - ``char(100)``
   :Description: Description - ``char(500)``
   :Latitude: 
     Geospacial latitude - ``double``

     See `Google API <https://developers.google.com/maps/articles/phpsqlsearch_v3?hl=fr&csw=1>`_
   :Longitude: Geospacial longitude - ``double``
   :Geometry: List of geospacial points delimiting an area - ``text``
   :Parents: List of parent locations, ``rule 2``  - ``foreign keys``

.. _uc1-1-1-rules:

Business Rules
--------------

:rule 1:
  ``Name`` must be unique.
:rule 2:
  A location can be included in many other locations.
:rule 3:
  Each modification on the ``Parents`` field invalidates all ``CDP``.

  These consolidates datapoints must then be recomputed before display.


