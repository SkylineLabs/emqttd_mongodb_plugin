PROJECT = emqttd_mongodb_plugin
PROJECT_DESCRIPTION = EMQTTD MongoDB 
PROJECT_VERSION = 2.0.7

DEPS = mongodb
dep_mongodb = git https://github.com/comtihon/mongodb-erlang.git master

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/emqtt/emqttd master
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqttd_mongodb_plugin.conf -i priv/emqttd_mongodb_plugin.schema -d data
