CONF={{ app_home}}/config.ini
VENV={{ app_home}}/env

all: syncdb loaddata collect

syncdb:
	. $(VENV)/bin/activate; export APP_CONFIG_ASSETS=$(CONF); aert-assets syncdb --noinput;
	chown www-data:www-data database.db

collect:
	. $(VENV)/bin/activate; export APP_CONFIG_ASSETS=$(CONF); aert-assets collectstatic --noinput;
	chown -R www-data:www-data {{ app_public }}

loaddata:
	. $(VENV)/bin/activate; export APP_CONFIG_ASSETS=$(CONF); aert-assets loaddata {{ app_fixtures }}/initial_data_auth.yaml
	. $(VENV)/bin/activate; export APP_CONFIG_ASSETS=$(CONF); aert-assets loaddata {{ app_fixtures }}/initial_data_students.yaml
	. $(VENV)/bin/activate; export APP_CONFIG_ASSETS=$(CONF); aert-assets loaddata {{ app_fixtures }}/initial_data_earnings.yaml
	. $(VENV)/bin/activate; export APP_CONFIG_ASSETS=$(CONF); aert-assets loaddata {{ app_fixtures }}/initial_data_spendings.yaml
	. $(VENV)/bin/activate; export APP_CONFIG_ASSETS=$(CONF); aert-assets loaddata {{ app_fixtures }}/initial_data_invoices.yaml
