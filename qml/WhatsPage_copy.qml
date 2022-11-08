import QtQuick 2.0
import QtQuick.Layouts 1.3
import "../js/functions.js" as JsFunc
import "components"

Rectangle {
    id: mainscreen

    color: "WhiteSmoke"

    property double lcolumns
    property double lrows

    property var fonts: Qt.fontFamilies()

    GridLayout {
        id: lgrid
        anchors.fill: parent
        columns: mainwindow.width / 100
        rows: mainwindow.height / 100
        rowSpacing: 12
        columnSpacing: 12
        anchors.margins: 55
        anchors.leftMargin: 70
        anchors.rightMargin: 70

        Repeater {
            id: srepeater

            model: lgrid.columns * lgrid.rows


            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                //width: mainwindow.width / 10
                //height: mainwindow.width / 10

                color: {
                    if (Number.isInteger(index/2) === true){
                        "purple"
                    } else {
                        "gray"
                    }


                }

                Text {
                    anchors.centerIn: parent
                    text: index
                }


                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        fonts.forEach(function(x){
                            console.log(x)
                        })

                   }


                }

            }

        }

    }

}
