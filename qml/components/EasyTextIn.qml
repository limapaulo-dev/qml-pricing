import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: rmain

    color: topbanner.color
    radius: 5
    Layout.fillWidth: true
    Layout.fillHeight: true

    property int rheight: rmain.height
    property int rwidth: rmain.width

    property string text1
    //property string text2

    TextInput {

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.margins: 10

        id: r1text
        text: text1
        color: "white"

        font.pointSize: {
            if (timmer === true){
                1
            } else if (rmain.height>rmain.width){
                 rmain.width * 0.25
            } else {
                rmain.height * 0.25
            }

        }

        verticalAlignment: Text.AlignVCenter

    }

    Component.onCompleted: {
        timmer = false
    }




}

