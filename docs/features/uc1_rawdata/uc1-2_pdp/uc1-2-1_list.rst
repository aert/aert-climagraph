
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

1. The user sets his search criterias and submits the form:

   **Search Criterias:**

   :Location:       Geographical area
   :DataPoint Type: Kind of data, *ex.: Wind, Rain, Rice Production, etc.*
   :Date Span:      Start date & end date

   **Actions:**

   :Search: Submits the input form 

2. The system displays the Primary DataPoints list according to previous
   search criterias.
   Each row contains : 

   **Data:**     

   :Date Sampled: Date of the sample  - ``date``
   :Timeslot:     Timeslot for the sampling in seconds - ``long``
   :Location:     *Exact* location of the sample, see ``rule 1`` - ``label``
   :Value:        measurement reported - ``double, nullable``

.. _uc1-2-1-rules:

Business Rules
--------------

:rule 1:
  Locations displayed in result list are exact locations of the sampled data.

  They can be sub locations included in the area of the search criteria.

:rule 2:
  When one of the ``PDPs`` field is changed, all ``CDPs`` are invalided.
