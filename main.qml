import QtQuick 2.9
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0


ApplicationWindow {
    visible: true
//    width: 640
//    height: 480
    width: 580
    height: 100
//    maximumHeight: 480
//    maximumWidth: 640
    maximumHeight: 100
    maximumWidth: 580
    title: qsTr("Набор номера")

    Component.onCompleted: { //Выполняется после старта приложения

//        try {
//            //Загружаем посление звонки
//            var datamodel = JSON.parse(settings.lastcalls)
//            var i;
//            lastcalls1.listModel.clear();
//            for (i = 0; i < datamodel.length; ++i) lastcalls1.listModel.append(datamodel[i])
//        } catch (err) {
//        }

//        try {
//            //Загружаем контакты
//            datamodel = JSON.parse(settings.contacts)
//            contacts1.listModel.clear();
//            for (i = 0; i < datamodel.length; ++i) contacts1.listModel.append(datamodel[i])
//        } catch (err) {
//        }


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

    Settings {
        id: settings
        category: 'main'
        property string phone_url: 'http://127.0.0.1';
        property string phone_user: 'admin';
        property string phone_passwd: 'password';
        property string outgoing_uri: 'admin@127.0.0.1';

        property string lastcalls: "{}"
        property string contacts: "{}"

    }

    function call_number(number, out_uri){
//        var only_number = number.replace(/[^0-9\+\*\#]/g, '') || ""; //Оставляем только нужные символы, а если вызывают по sip логину? - Нельзя так удалять!
          var only_number = number.replace(/[ \(\)\-]/g, '') || ""; //Удаляем лишние символы

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
//                add_lastcall({
//                                                "number": phonenumber.text,
//                                                "name"  : phonenumber.phone_name,
//                                                "date"  : formatDate(new Date())
//                                            })
            }

        }
        Button {
            id: call_stop
//            icon.source: "img/icons8-phone-32.png"
            font.pixelSize: 24
            text: qsTr("Положить")

            onClicked: send_key('Cancel')
        }
    }
}
//    SwipeView{
//        id: swipeView
//        anchors.fill: parent
//        currentIndex: tabBar.currentIndex

//        Lastcalls{
//            id: lastcalls1


//        }

//        Contacts{
//            id: contacts1
//        }

//        Options{
//            id: options1
//        }


//    }

//    footer: TabBar{
//        id: tabBar
//        currentIndex: swipeView.currentIndex
//        font.pixelSize: 20

//        TabButton{
//            text: qsTr("Вызовы")
//        }
//        TabButton{
//            text: qsTr("Контакты")
//        }
//        TabButton{
//            text: qsTr("Настройки")
//        }
//    }

}
