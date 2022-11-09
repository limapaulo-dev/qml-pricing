import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

RowLayout {
    property var gTitle
    property var obsTitle
    property var idades: parseInt(idade.text)
    property bool chkObs: obs.checked
    property bool obsVisible
    property double obsOpacity

    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 5

    GroupBox {
        id: idadeG
        Layout.preferredHeight: nameGroup.height
        Layout.fillWidth: true
        title: gTitle

        font.pointSize: fGSize - 1
        padding: padGroup
        topPadding: 25
        bottomPadding: 5
        rightPadding: 5
        leftPadding: 5
        spacing: 4

        TextField {
            id: idade
            text: qsTr("")
            font.pointSize: fTSize - 1
            placeholderText: " Digite a idade"
            anchors.fill: parent
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            maximumLength: 2
            padding: 2
            rightPadding: 2
            leftPadding: 2
            bottomPadding: 2
            topPadding: 2
            background: null
            selectByMouse: true

            validator:  DoubleValidator {
                                notation: DoubleValidator.StandardNotation
                                decimals: 3
                                bottom: -99.99
                                top: 99.99
                            }

            inputMethodHints: Qt.ImhFormattedNumbersOnly | Qt.ImhNoPredictiveText

        }
    }

    GroupBox {
        id: gobs
        font.pointSize: fGSize - 1
        Layout.preferredHeight: idadeG.height
        Layout.fillWidth: true
        title: obsTitle
        padding: padGroup
        topPadding: 25
        bottomPadding: 5
        rightPadding: 5
        leftPadding: 5
        spacing: 4
        opacity: obsOpacity

        RadioDelegate {
            id: obs
            anchors.fill: parent
            autoExclusive: false
            spacing: 0
            display: AbstractButton.IconOnly
            visible: obsVisible
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }

    }

}
