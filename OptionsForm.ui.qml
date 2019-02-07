import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    width: 400
    height: 400
    property alias button: button
    property alias phone_url: phone_url
    property alias phone_user: phone_user
    property alias phone_passwd: phone_passwd
    property alias outgoing_uri: outgoing_uri

    Grid {
        id: grid
        anchors.topMargin: 50
        columns: 2
        anchors.fill: parent
        Label {
            id: label
            text: qsTr("Адрес телефона")
            font.pointSize: 18
        }
        TextField {
            id: phone_url
            text: settings.phone_url
            font.pixelSize: 18
        }

        Label {
            id: label1
            text: qsTr("Пользователь")
            font.pointSize: 18
        }
        TextField {
            id: phone_user
            text: settings.phone_user
            font.pixelSize: 18
        }

        Label {
            id: label2
            text: qsTr("Пароль")
            font.pointSize: 18
        }
        TextInput {
            id: phone_passwd
            text: settings.phone_passwd
            echoMode: TextInput.Password
            font.pixelSize: 18
        }

        Label {
            id: label3
            text: qsTr("Ваш номер")
            font.pointSize: 18
        }

        TextField {
            id: outgoing_uri
            text: settings.outgoing_uri
            font.pixelSize: 18
        }
    }

    Button {
        id: button
        x: 30
        y: 214
        text: qsTr("Сохранить")
        font.pointSize: 18
    }
}
