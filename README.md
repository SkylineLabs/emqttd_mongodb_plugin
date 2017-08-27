# emqttd_mongodb_plugin
A plugin for the EMQ broker to store the status of devices connecting via MQTT to a MongoDB database


**This project is a sub-module of ConnectX IoT platform.**
**Refer https://github.com/SkylineLabs/ConnectX-IoT-platform for more details**


Install Plugin:
-------

1. clone emq-relx project
```
git clone https://github.com/emqtt/emq-relx.git
```
1. Add DEPS of the plugin in emq-relx/Makefile
```
DEPS += emqttd_mongodb_plugin
dep_emqttd_mongodb_plugin = git https://github.com/SkylineLabs/emqttd_mongodb_plugin.git master
```
3. Add plugin in emq-relx/relx.config
```
{emqttd_mongodb_plugin, load},
```
4. Build
```
cd emq-relx && make
```

Requirements
-------

1) MongoDB needs to be running on localhost:2181
2) All devices connecting to the broker need to have a client id of the form -
```
ProjectName/ThingType/ThingName
eg:
HomeAutomation/Kitchen/Light
```
3)Create a mongoDB database "thingsDB"
Insert in collection "HomeAutomation" the following document:
```
{_id:"Kitchen/Light", "connected":0}
```

Test the plugin
------
When a client (say HomeAutomation/Kitchen/Light) connects via MQTT,
the corresponding document in the "thingsDB" in the corresponding collection "HomeAutomation" will get updated to :
```
{_id:"Kitchen/Light", "connected":1, "timestap":24-07-2017 20:34:37}
```
The purpose of timestamp:
1) If connected is 0, then timestamp tells the last seen of the device
2) If connected is 1, then timestamp tells the time since which the device is online


