CallMyNumber

Dieses Programm ermöglicht es Ihnen, die Telefonnummer auf Yealink T23G, T21P_E2 zu wählen.

Sie können aus der Anwendung selbst, über Kontakte in Outlook 2013-2016 oder durch Klicken auf den Telefonnummernlink in Ihrem Browser wählen.

Das Hauptprogramm ist in QT QML 5.11 geschrieben.

Das Outlook-Add-on ist in der Community Edition von C# Visual Studio 2017 geschrieben.

Das Skript zur Vorbereitung der kompilierten Hauptanwendung build_deploy_qml.bat

Das Build-Skript installer.iss (Inno Setup Script Wizard)

Die erstellte Distribution kopiert Programme auf %userappdata%\CallMyPhone.

Registriert den Zusatz zum Ausblick

Registriert die Hauptanwendung für Tel- und Callto-URI-Adressen im System

Um die Fernsteuerung in Ihrem Yealink-Telefon zu aktivieren, müssen Sie dies tun:

1 Melden Sie sich an der Webschnittstelle des Telefons an

2 Sprungfunktionen - Verbindungsüberwachung

3 Geben Sie im Parameter "IP-Adressen für das Senden des Aktions-URI" die IP-Adresse des Computers an, von dem aus Sie steuern werden

4 Für den ersten Satz muss die Kontrollgenehmigungsanfrage bejaht werden.

Das Programm speichert seine Einstellungen in der Registry

[HKEY_CURRENT_USER\Software\Rufen SieMeinPhone\Haupt]

Parameter:

phone_user - Benutzer, der sich in die Web-Schnittstelle des Telefons einloggt, normalerweise admin

phone_passwd - Kennwort

Outgoing_uri - Konto, von dem aus gewählt werden kann, zum Beispiel "user1@19.rt.ru".

phone_url - URL des Telefons, zum Beispiel "http://192.168.1.55".
