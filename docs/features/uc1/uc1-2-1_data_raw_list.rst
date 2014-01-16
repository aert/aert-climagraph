
.. _uc1-2-1:

uc1.2.1: List PDPs
******************

Actors
------

#. User

Preconditions
-------------

1. User is authenticated
2. There is at least one ``Location`` in database.

Post-conditions
---------------

1. PDPs are listed
2. Search criterias are applied to the results

Normal flow
-----------

1. The user sets his search criterias and submits :

   **Search Criterias:**

   * ``Location`` : Geographical area
   * ``DataPoint Type`` : *ex.: Wind, Rain, Rice Production, etc.*
   * ``Date Span``: Start date & end date

   **Actions:**

   * ``Submit``

2. The system displays the Primary DataPoints list according to previous
   search criterias.
   Each row contains : 

   **Data:**     

   * ``Date Sampled`` : Date of the sample  - ``date``
   * ``Timeslot`` : Timeslot for the sampling in seconds - ``long``
   * ``Location`` : *Exact* location of the sample, see ``rule 1`` - ``label``
   * ``Value`` : measurement reported - ``double``


Business Rules
--------------

:rule 1:
  Locations displayed in result list are exact locations of the sampled data.

  They can be sub locations included in the area of the search criteria.

