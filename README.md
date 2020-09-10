# CallMyPhone
Dialing a telephone number

This programme allows you to dial the phone number on Yealink T23G, T21P_E2 units.

You can dial from the application itself, via contacts in Outlook 2013-2016 or by clicking on the phone number link in your browser.

The main program is written in QT QML 5.11

The Outlook add-on is written in C# Visual Studio 2017 Community Edition

Preparation script of the compiled basic application build_deploy_qml.bat

Distributor.iss (Inno Setup Script Wizard)

The collected distribution copies the programs in %userappdata%\CallMyPhone.

Registers the addition to the outlook

Register the main application for URI tel and callto addresses in the system

In order to enable remote control in your Yealink phone, you need to have remote control:

1 Log in to the phone's web interface

2 Go Functions - Connection monitoring

3 In the parameter "IP addresses for sending the Action URI" specify the IP address of the computer from which you are going to manage.

4 For the first recruitment, the management approval request must be answered in the affirmative.

The programme stores its settings in the register

[HKEY_CURRENT_USER\Software\CallMyPhone\main].

Parameters:

phone_user - user to login to the web interface of the phone, usually admin

phone_passwd - password

An account from which to dial, for example "user1@19.rt.ru".

phone_url - URL of the phone, e.g. "http://192.168.1.55".
