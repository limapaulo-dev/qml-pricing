import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Button {

    width: parent.height
    height: parent.height

    ToolTip.visible: hovered && !down
    ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
    ToolTip.text: qsTr("Maximize")

    property bool isMaximized: false

    contentItem: Item {
        Image {
            anchors.centerIn: parent
            sourceSize.width: parent.height * 0.5
            sourceSize.height: parent.height * 0.5

            source: isMaximized ? "../../Icons/square.double.svg" : "../../Icons/square.svg"

            layer {
                    enabled: true
                    effect: ColorOverlay {
                        color: "#ffffff"
                    }

            }
        }
    }

    background: Rectangle {
        visible: parent.down || parent.hovered
        color: parent.down ? "#80808080" : (parent.hovered ? "#80c7c7c7" : "transparent")
    }
}
