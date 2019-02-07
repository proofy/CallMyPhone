import QtQuick 2.4

OptionsForm {
    button.onClicked: {
    settings.phone_url = phone_url.text;
    settings.phone_user = phone_user.text;
    settings.phone_passwd = phone_passwd.text;
    settings.outgoing_uri = outgoing_uri.text;
}
}
