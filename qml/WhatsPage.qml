import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import "../js/functions.js" as JsFunc
import "components"

Rectangle {

    id: mainscreen

    property bool timmer: true


    GridLayout {

        id: lgrid
        anchors.fill: parent
        rowSpacing: 5
        columnSpacing: 5
        columns: 3

        EasyText {

            text1: "Nome"

        }

        EasyTextF {

            easytext: "Ex: Nome do Cliente"
            Layout.columnSpan: 2

        }

        EasyText {
            id: tipo

            text1: "Tipo"

        }

        EasyText {

            text1: "Familiar / Individual"

        }

        EasyText {

            id:emp

            text1: "Empresarial"


        }

        EasyText {

            text1: "Idade"

        }

        EasyTextF {

            easytext: "Ex: 32"

        }

        EasyText {
            id: easyText
            CheckBox {
                id: checkBox
                text: qsTr("Check Box")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }



        }

        EasyText {

            text1: "Idade"

        }

        EasyTextF {

            easytext: "Ex: 32"

        }

        EasyText {

            text1: "C/ Obs"

        }

        EasyText {

            text1: "Idade"

        }

        EasyTextF {

            easytext: "Ex: 32"

        }

        EasyText {

            text1: "C/ Obs"

        }






    }


}
