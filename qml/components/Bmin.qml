import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Button {

    width: parent.height
    height: parent.height

    ToolTip.visible: hovered && !down
    ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
    ToolTip.text: qsTr("Minimize")

    Image {
        anchors.centerIn: parent
        sourceSize.width: parent.height * 0.3
        sourceSize.height: parent.height * 0.3
        source: "../../Icons/minus.svg"

        layer {
                enabled: true
                effect: ColorOverlay {
                    color: "#ffffff"
                }

        }
    }


    background: Rectangle {
        visible: parent.down || parent.hovered
        color: parent.down ? "#80808080" : (parent.hovered ? "#80c7c7c7" : "transparent")
    }
}
