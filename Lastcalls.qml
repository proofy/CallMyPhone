import QtQuick 2.4

LastcallsForm {
    btn_1.onClicked: {
        send_key('1');
        phonenumber.text += '1';
    }
    btn_2.onClicked: {
        send_key('2')
        phonenumber.text += '2';
    }
    btn_3.onClicked: {
        send_key('3')
        phonenumber.text += '3';
}
    btn_4.onClicked: {
        send_key('4')
        phonenumber.text += '4';
    }
    btn_5.onClicked: {
        send_key('5')
        phonenumber.text += '5';
    }
    btn_6.onClicked: {
        send_key('6')
        phonenumber.text += '6';
    }
    btn_7.onClicked: {
        send_key('7')
        phonenumber.text += '7';
    }
    btn_8.onClicked: {
        send_key('8')
        phonenumber.text += '8';
    }
    btn_9.onClicked: {
        send_key('9')
        phonenumber.text += '9';
    }
    btn_asterisk.onClicked: {
        send_key('*')
        phonenumber.text += '*';
    }
    btn_0.onClicked: {
        send_key('0')
        phonenumber.text += '0';
    }
    btn_hash.onClicked: {
        send_key('#')
        phonenumber.text += '#';
    }
    //lastcallsModel: lastcallsModel
//    property alias listModel: listModel
    lastcalls_listView.onCurrentItemChanged: {
//        console.log(listModel.get(lastcalls_listView.currentIndex).number + ' selected')
        if (lastcalls_listView.first_load === "false") {
            lastcalls_listView.first_load = "true";
            lastcalls_listView.currentIndex = -1; //Исправляет косяк 0-го элемента его не выбрать без этого
        } else {
        if (lastcalls_listView.currentIndex >= 0){
            phonenumber.text = listModel.get(lastcalls_listView.currentIndex).number || ""; //Загружаем вызываемый номер
            phonenumber.phone_name = listModel.get(lastcalls_listView.currentIndex).name || qsTr("Не указан"); //Загружаем ФИО вызываемого номер если указано
        }
}

    }




}
