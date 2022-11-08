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

    Text {
        id: r1text
        anchors.margins: 10
        anchors.fill: parent

        text: text1
        color: "white"

        font.pointSize: {
            if (timmer === true){
                1
            } else if (rmain.height>rmain.width){
                 rmain.width * 0.15
            } else {
                rmain.height * 0.15
            }

        }

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

    }

    Component.onCompleted: {
        timmer = false
        console.log(rheight + "  " + rwidth)
        console.log(r1text.height + "  " + r1text.width)
    }

}

