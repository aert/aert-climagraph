
.. _uc1-3-1:

uc1.3.1: Import PDPs
********************

| DRAFT.

This use case allows primary data points to be batch added to the system.

Actors
------

#. User

Preconditions
-------------

1. User is authenticated.

Post-conditions
---------------

1. All ``PDPs`` are *added* with correct informations *if all data are valid*.
2. All ``PDPs`` are *rejected* if ``1.`` is not satisfied.
3. All ``CDP`` are invalidated.
4. A summary of success / failures is displayed.

Normal flow
-----------

| DRAFT.

1. The user launches this use case.
2. The system displays the following input form:

   **Data:**     

   :File: The **CSV** file to be uploaded - ``file``

   **Actions:**

   :Step 1/2 - Upload File: Starts import operations.

3. The user launches ``Import`` action.
4. The system saves CSV data to the server.
5. The system validates ``PDPs`` data contained in the file and shows a summary
   of the data to be integrated.
6. The system asks for action :

   **Actions:**

   :Step 2/2 - Add Data Points: Integrates uploaded data to the system's database.

7. The system saves the ``PDPs`` in temporary databases.
8. The system checks data integrity according to existing ``PDPs``,
   see ``rule 2``.
9. The system creates final ``PDPs`` and removes temporary ones.
10. The system invalidates all ``CDPs``.

Alternate flows
---------------

| DRAFT.

5a. Error validating CSV data:

    5a.1. The system removes the upload file.
    5a.2. The system displays a summary of the error
    5a.3. *End of the use case*
    
9a. Error creating Final ``PDPs``:

    9a.1. The system rolls back changed data: all succeeded ``PDPs`` are deleted.
    9a.2. The system displays a summary of the error
    9a.3. *End of the use case*

Business Rules
--------------

:rule 1:
  Only **CSV** files are allowed.
:rule 2:
  Imported ``PDPs`` must not be already existing in database, i.e. primary keys
  must be different.
