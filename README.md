<h1 style="font-weight:normal">
  &nbsp;Crabgrass: An MQTT Cloud Agent&nbsp;
  <a href="overview"><img src=overview.png></a>
</h1>

An open-source MQTT Cloud Agent to control Edge Devices.

This project is still in beta - please use at your own risk and post any bugs to [issues](https://https://github.com/braunku/crabgrass/issues)
<br>

Features
========
* API to run linux commands remotely >>
  Just publish to topic "cli"
* API for monitor CLI responses (complete, fail, status, etc.) >>
  Just subscribe to topic "cli_response"
 <a href="control"><img src=control.png></a>

<br>
Use Cases for Remote Access
========
* Install Docker ipk on PFC200 in the field
* Install Node-RED 
* Stop / Start / Pull containers
* Remove Docker images
* Reboot the PFC 
* Perform diagnostics (check FW version, df -h, etc.)
* Update system settings (Disable PLC Runtime, Unused Ports, etc.)

Get started
===========
* Copy ipk to PFC root folder.  >>
  wget https://github.com/braunku/crabgrass/releases/main/crabgrass_0.01_armhf.ipk
* Install IPK on FW18 >>
  opkg install crabgrass_0.01_armhf.ipk
* configure your MQTT client >>
  nano /etc/config.cfg
* cp /lib/libconfig.so.9 /lib/libconfig.so.11 (Not sure why compiler looks for wrong version, will fix in next release.)
* Run agent >>
  crabgrass

Requirements
============
PFC200 with Firmware 18

License
=======
crabgrass is under the MIT license. See the [LICENSE](https://github.com/braunku/crabgrassblob/main/LICENSE.md) for more information.

Links
=====
* [Kurt Braun YouTube](https://www.youtube.com/channel/WAGOKurt)
* [Kurt Braun LinkedIn](https://www.linkedin.com/in/wago-kurt-braun/)
