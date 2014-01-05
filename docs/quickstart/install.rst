
Installation
************
 
Development
===========

#. Install requirements::

   $ make develop

#. Run development web server::

   $ make runserver

#. Test in web browser::

    http://localhost:9000


Vagrant
=======

#. Start vagrant and provision::

   $ make vagrant

#. Test in web browser::

    http://<vagrant_ip>


Release
=======

#. Install requirements::

   $ pip install climagraph

#. Generate default conf::

   $ climagraph init 

#. Tweak conf file in ``~/.climagraph/config.conf``
#. Init database, assets and run gunicorn server::

   $ climagraph syncdb
   $ climagraph collectstatic
   $ climagraph start
