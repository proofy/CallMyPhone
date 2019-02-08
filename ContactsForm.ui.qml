import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    width: 400
    height: 400
    property alias listModel: listModel

    ScrollView {
        anchors.leftMargin: 5
        anchors.fill: parent

        ListView {
            id: listView
            anchors.fill: parent
            model: ListModel {
                id: listModel // задаём ей id для обращения
            }

            delegate: ItemDelegate {
                width: parent.width
                height: 50

                Column {
                    width: parent.width
                    Text {
                        font.pixelSize: 20
                        text: name
                    }
                    Text {
                        font.pixelSize: 16
                        text: date + " " + number
                    }
                }
            }
        }
    }
}
