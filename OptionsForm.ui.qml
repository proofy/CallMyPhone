import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 630
    height: 400
    property alias button: button
    property alias phone_url: phone_url
    property alias phone_user: phone_user
    property alias phone_passwd: phone_passwd
    property alias outgoing_uri: outgoing_uri

    Grid {
        id: grid
        anchors.leftMargin: 4
        anchors.topMargin: 60
        columns: 2
        spacing: 6
        anchors.fill: parent

        Label {
            id: label
            text: qsTr("Адрес телефона")
            font.pointSize: 16
        }
        TextField {
            id: phone_url
            width: 400
            text: settings.phone_url
            //            anchors.right: parent.right
            //            anchors.rightMargin: 200
            //            anchors.right: parent.right
            //            anchors.rightMargin: 20
            font.pixelSize: 16
        }

        Label {
            id: label1
            text: qsTr("Пользователь")
            font.pointSize: 16
        }
        TextField {
            id: phone_user
            width: 400
            text: settings.phone_user
            //            anchors.right: parent.right
            //            anchors.rightMargin: 20
            font.pixelSize: 16
        }

        Label {
            id: label2
            text: qsTr("Пароль")
            font.pointSize: 16
        }
        TextInput {
            id: phone_passwd
            width: 400
            text: settings.phone_passwd
            //            anchors.right: parent.right
            //            anchors.rightMargin: 11
            echoMode: TextInput.Password
            font.pixelSize: 16
        }

        Label {
            id: label3
            text: qsTr("Ваш номер")
            font.pointSize: 16
        }

        TextField {
            id: outgoing_uri
            width: 400
            text: settings.outgoing_uri
            //            anchors.right: parent.right
            //            anchors.rightMargin: 20
            font.pixelSize: 16
        }
    }

    Button {
        id: button
        y: 246
        text: qsTr("Сохранить")
        anchors.left: parent.left
        anchors.leftMargin: 130
        anchors.right: parent.right
        anchors.rightMargin: 152
        font.pointSize: 16
    }
}
