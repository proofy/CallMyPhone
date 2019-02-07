import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 400
    height: 400
    property alias lastcalls_listView: lastcalls_listView
    transformOrigin: Item.Center
    property alias btn_hash: btn_hash
    property alias btn_0: btn_0
    property alias btn_asterisk: btn_asterisk
    property alias btn_9: btn_9
    property alias btn_8: btn_8
    property alias btn_7: btn_7
    property alias btn_6: btn_6
    property alias btn_5: btn_5
    property alias btn_4: btn_4
    property alias btn_3: btn_3
    property alias btn_2: btn_2
    property alias btn_1: btn_1
    property alias listModel: listModel

    //property alias lastcallsModel: lastcallsModel
    Row {
        id: row
        anchors.fill: parent
        //        anchors.horizontalCenter: parent.horizontalCenter
        //        anchors.verticalCenter: parent.verticalCenter
        spacing: 6

        ScrollView {
            id: scrollView
            anchors.leftMargin: 5
            anchors.topMargin: 40
            anchors.fill: parent
            contentHeight: 0
            contentWidth: 320
            //            anchors.left: parent.left
            //            anchors.leftMargin: 0

            //            anchors.left: parent.left
            //            anchors.right: grid.left
            //            anchors.leftMargin: 0
            ListView {
                id: lastcalls_listView
                anchors.fill: parent
                spacing: 5
                property string first_load: "false"
                //                anchors.fill: parent
                //                anchors.fill: parent
                model: ListModel {
                    id: listModel // задаём ей id для обращения
                }

                delegate: ItemDelegate {
                    width: parent.width
                    highlighted: ListView.isCurrentItem
                    onClicked: lastcalls_listView.currentIndex = index

                    //                    MouseArea {
                    //                        anchors.fill: parent
                    //                        onClicked: lastcalls_listView.currentIndex = index
                    //                    }
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
                    //                    text: "Item Последние вызовы" + (index + 1)
                    //                    text: number + "\n" + name
                }
            }
        }

        Grid {
            id: grid
            x: 199
            y: 91
            anchors.right: parent.right
            anchors.rightMargin: 39
            //            anchors.right: parent.right
            //            anchors.rightMargin: 39
            //            anchors.right: parent.right
            //            anchors.rightMargin: 39
            //        transformOrigin: Item.Center

            //            anchors.horizontalCenter: parent.horizontalCenter
            //            anchors.verticalCenter: parent.verticalCenter
            columns: 3
            spacing: 6

            Button {
                //            color: "#aa6666"
                id: btn_1
                width: 50
                height: 50
                Text {
                    text: qsTr("1")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#aaaa66"
                id: btn_2
                width: 50
                height: 50
                Text {
                    text: qsTr("2")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#9999aa"
                id: btn_3
                width: 50
                height: 50
                Text {
                    text: qsTr("3")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#6666aa"
                id: btn_4
                width: 50
                height: 50
                Text {
                    text: qsTr("4")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#aa6666"
                id: btn_5
                width: 50
                height: 50
                Text {
                    id: text1
                    text: qsTr("5")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#aaaa66"
                id: btn_6
                width: 50
                height: 50
                Text {
                    text: qsTr("6")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#9999aa"
                id: btn_7
                width: 50
                height: 50
                Text {
                    text: qsTr("7")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#6666aa"
                id: btn_8
                width: 50
                height: 50
                Text {
                    id: text2
                    text: qsTr("8")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#aa6666"
                id: btn_9
                width: 50
                height: 50
                Text {
                    text: qsTr("9")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#aaaa66"
                id: btn_asterisk
                width: 50
                height: 50
                Text {
                    text: qsTr("*")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#9999aa"
                id: btn_0
                width: 50
                height: 50
                Text {
                    text: qsTr("0")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
            Button {
                //                    color: "#6666aa"
                id: btn_hash
                width: 50
                height: 50
                Text {
                    text: qsTr("#")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 26
                }
            }
        }
    }
}
