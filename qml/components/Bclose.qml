import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Button {

    width: parent.height
    height: parent.height

    ToolTip.visible: hovered && !down
    ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
    ToolTip.text: qsTr("Close")

    Image {
        anchors.centerIn: parent
        sourceSize.width: parent.height * 0.3
        sourceSize.height: parent.height * 0.4

        source: "../../Icons/times.svg"

        layer {
                enabled: true
                effect: ColorOverlay {
                    color: "#ffffff"
                }

        }
    }

    //contentItem: Item {
    //    Image {
    //        anchors.centerIn: parent
    //        source: control.down || control.hovered ? "qrc:/res/close-button2.png" : "qrc:/res/close-button1.png"
    //    }
    //}

    background: Rectangle {
        visible: parent.down || parent.hovered
        color: parent.down ? "#8c0a15" : (parent.hovered ? "#e81123" : "transparent")
    }
}
