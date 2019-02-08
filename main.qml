import QtQuick 2.9
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0

ApplicationWindow {
    id: mainApplication
    visible: true
    width: 640
    height: 480
    maximumWidth: 640
    maximumHeight: 480
    title: qsTr("Набор номера")

    Settings {
        id: settings
        category: 'main'
        property string phone_url: 'http://127.0.0.1';
        property string phone_user: 'admin';
        property string phone_passwd: 'password';
        property string outgoing_uri: 'admin@127.0.0.1';

        property string lastcalls: "{}"
        property string contacts: "{}"

        property bool full_mode_switch: false

    }

    function change_window_mode(mode) {
        if (mode === true){
            mainApplication.maximumHeight = 480;
            mainApplication.maximumWidth  = 640;
            mainApplication.height = 480;
            mainApplication.width  = 640;
            settings.full_mode_switch = true
        } else {
            mainApplication.maximumHeight = 70;
            mainApplication.maximumWidth  = 640;
            mainApplication.height = 70;
            mainApplication.width  = 640;
            settings.full_mode_switch = false
        }
    }

    function clear_number(number){ //Удаляет лишние символы из номера
        return number.replace(/[^0-9\+\*\#a-zA-Z\_]/g, '') || ""; //Оставляем только нужные символы
    }

    Component.onCompleted: { //Выполняется после старта приложения
       // switch1.checked = settings_window.full_mode_switch;
        change_window_mode(settings.full_mode_switch);

        var i;

//        try {
//            //Загружаем контакты
//            var datamodel_contacts = JSON.parse(settings.contacts)
//            contacts1.listModel.clear();
//            for (i = 0; i < datamodel_contacts.length; ++i) contacts1.listModel.append(datamodel_contacts[i])
//        } catch (err) {
//        }


//        function get_name(contacts, number){
//            for (var i = 0; i < contacts.length; ++i){

//                if ((clear_number(contacts[i].number) === clear_number(number))&& contacts[i].name !== "Не указан"){
//                    return contacts[i].name;
//                }
//            }
//            return "";
//        }

        try {
            //Загружаем посление звонки
            var datamodel_lastcalls = JSON.parse(settings.lastcalls)
            lastcalls1.listModel.clear();
            for (i = 0; i < datamodel_lastcalls.length; ++i){

//                datamodel_lastcalls[i].name = get_name(datamodel_contacts, datamodel_lastcalls[i].number) || datamodel_lastcalls[i].name;

                lastcalls1.listModel.append(datamodel_lastcalls[i])
            }
        } catch (err) {
        }



        phonenumber.text = get_cmd_phonenumber(); //Загружаем вызываемый номер
        phonenumber.phone_name = get_cmd_phonename() || qsTr("Не указан"); //Загружаем ФИО вызываемого номер если указано


    }

    function get_cmd_phonenumber(){
        if (Qt.application.arguments.length > 1){
            var only_number = Qt.application.arguments[1];
            only_number = only_number.replace(/^tel\:/gi, '') || ""; //Удаляем лишние символы
            only_number = only_number.replace(/^callto\:/gi, '') || ""; //Удаляем лишние символы

            return only_number;
            //Qt.application.arguments.length    //gives argc
        }
        return '';
    }

    function get_cmd_phonename(){
        if (Qt.application.arguments.length > 2){
            return Qt.application.arguments[2] //access items in argv
            //Qt.application.arguments.length    //gives argc
        }
        return '';
    }


//    Qt.application.arguments[argIndex] //access items in argv
//    Qt.application.arguments.length    //gives argc


    function call_number(number, out_uri){
        var only_number = clear_number(number); //Оставляем только нужные символы
//          var only_number = number.replace(/[ \(\)\-]/g, '') || ""; //Удаляем лишние символы

        if (only_number !== "") {
            var request = new XMLHttpRequest();
            request.open('GET', settings.phone_url + '/cgi-bin/ConfigManApp.com?number=' + encodeURIComponent(only_number) + '&outgoing_uri=' + encodeURIComponent(out_uri))
            request.setRequestHeader("Authorization", "Basic " + Qt.btoa(settings.phone_user + ':' + settings.phone_passwd));
            request.onreadystatechange = function () {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status === 200) {
                        console.log(request.responseText)
                    } else {
                        console.log("HTTP request failed", request.status)
                    }
                }
            }
            request.send();
        }
    }

    function send_key(key){
        if (key !== "") {
            var request = new XMLHttpRequest();
            request.open('GET', settings.phone_url + '/servlet?key=' + encodeURIComponent(key))
            request.setRequestHeader("Authorization", "Basic " + Qt.btoa(settings.phone_user + ':' + settings.phone_passwd));
            request.onreadystatechange = function () {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status === 200) {
                        console.log(request.responseText)
                    } else {
                        console.log("HTTP request failed", request.status)
                    }
                }
            }
            request.send();
        }
    }
    function add_lastcall(param){
        if (lastcalls1.listModel.count > 20){
            lastcalls1.listModel.remove(lastcalls1.listModel.count - 1);
        }

        if (phonenumber.text !== get_cmd_phonenumber()){
            phonenumber.phone_name = qsTr("Не указан");
            param.name = qsTr("Не указан");
        }

//        lastcalls1.listModel.append(param)
        lastcalls1.listModel.insert(0, param)

        var datamodel = []
        for (var i = 0; i < lastcalls1.listModel.count; ++i) datamodel.push(lastcalls1.listModel.get(i))
        //datastore = JSON.stringify(datamodel)

        settings.lastcalls = JSON.stringify(datamodel)
    }

    function formatDate(date) {

      var dd = date.getDate();
      if (dd < 10) dd = '0' + dd;

      var mm = date.getMonth() + 1;
      if (mm < 10) mm = '0' + mm;

      var yyyy = date.getFullYear();

      var hh = date.getHours();
      if (hh < 10) hh = '0' + hh;

      var MM = date.getMinutes();
      if (MM < 10) MM = '0' + MM;

      return dd + '.' + mm + '.' + yyyy + ' ' + hh + ':' + MM;
    }



    header: Item {

        Row {
             anchors.right: parent.right
             anchors.left: parent.left
             spacing: 6

        TextField {
            id: phonenumber
            placeholderText: qsTr("Введите номер телефона")
            text: qsTr("") //qsTr("89012010251")
            font.pixelSize: 24
            selectByMouse: true
            onAccepted: call.clicked()
            property string phone_name: qsTr("Не указан")

        }
        Button {
            id: call
//            icon.source: "img/icons8-call-32.png"
            font.pixelSize: 24
            text: qsTr("Позвонить")

            onClicked: {
                call_number(phonenumber.text, settings.outgoing_uri);
                add_lastcall({
                                                "number": phonenumber.text,
                                                "name"  : phonenumber.phone_name,
                                                "date"  : formatDate(new Date())
                                            })
            }

        }
        Button {
            id: call_stop
//            icon.source: "img/icons8-phone-32.png"
            font.pixelSize: 24
            text: qsTr("Положить")

            onClicked: send_key('Cancel')
        }
        Switch {
            id: switch1
          //  anchors.top: call_stop.bottom
//            x: 117
//            y: 282
            text: qsTr("Дополнительно")
            checked: settings.full_mode_switch
            onClicked: {
                change_window_mode(this.checked);
            }

        }

        }

}
    SwipeView{
        id: swipeView
        anchors.fill: parent
        visible: settings.full_mode_switch
        currentIndex: tabBar.currentIndex

        Lastcalls{
            id: lastcalls1


        }

//        Contacts{
//            id: contacts1
//        }

        Options{
            id: options1
        }


    }

    footer: TabBar{
        id: tabBar
        currentIndex: swipeView.currentIndex
        visible: settings.full_mode_switch

        font.pixelSize: 20

        TabButton{
            text: qsTr("Вызовы")
        }
//        TabButton{
//            text: qsTr("Контакты")
//        }
        TabButton{
            text: qsTr("Настройки")
        }
    }

}
