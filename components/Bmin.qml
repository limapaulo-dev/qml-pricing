import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

Button {
    Layout.preferredHeight: parent.height
    Layout.preferredWidth: parent.height

    ToolTip.visible: hovered && !down
    ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
    ToolTip.text: qsTr("Minimizar")

    Material.background: "transparent"

    topInset: 1
    bottomInset: 1
    padding: 0
    horizontalPadding: 0
    spacing: 6

    Image {
        anchors.centerIn: parent
        sourceSize.width: parent.height * 0.3
        sourceSize.height: parent.height * 0.3
        source: "../icons/minus.svg"

        layer {
                enabled: true
                effect: ColorOverlay {
                    color: "#ffffff"
                }

        }
    }

    onClicked: showMinimized()

    background: Rectangle {
        visible: parent.down || parent.hovered
        color: parent.down ? "#80808080" : (parent.hovered ? "#80c7c7c7" : "transparent")
    }
}
