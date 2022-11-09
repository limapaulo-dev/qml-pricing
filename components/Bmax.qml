import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

Button {

    Material.background: "transparent"

    Layout.preferredHeight: parent.height
    Layout.preferredWidth: parent.height

    ToolTip.visible: hovered && !down
    ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
    ToolTip.text: qsTr("Maximizar")

    topInset: 1
    bottomInset: 1
    padding: 0
    horizontalPadding: 0
    spacing: 6

    property bool isMaximized: false

    contentItem: Item {
        Image {
            anchors.centerIn: parent
            sourceSize.width: parent.height * 0.4
            sourceSize.height: parent.height * 0.4

            source: isMaximized ? "../icons/square.double.svg" : "../icons/square.svg"

            layer {
                    enabled: true
                    effect: ColorOverlay {
                        color: "#ffffff"
                    }

            }
        }
    }

    onClicked: {
        if (Window.Maximized === mainwindow.visibility) {
            showNormal()
        } else {
            showMaximized()
        }
    }

    background: Rectangle {
        visible: parent.down || parent.hovered
        color: parent.down ? "#80808080" : (parent.hovered ? "#80c7c7c7" : "transparent")
    }
}
