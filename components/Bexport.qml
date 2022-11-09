import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Button {

    property string toolTip
    property string imagSource
    property var bdesaturation

    Material.background: "transparent"

    Layout.preferredHeight: parent.height
    Layout.preferredWidth: parent.height

    ToolTip.visible: hovered && !down
    ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
    ToolTip.text: qsTr(toolTip)

    topInset: 1
    bottomInset: 1
    padding: 0
    horizontalPadding: 0
    spacing: 6

    contentItem: Item {
        Image {
            id:image
            anchors.centerIn: parent
            sourceSize.width: parent.height * 0.85
            sourceSize.height: parent.height * 0.85

            source: imagSource

            layer {
                    enabled: true
                    effect: Desaturate {
                        desaturation: bdesaturation
                    }

            }

        }




    }

}
