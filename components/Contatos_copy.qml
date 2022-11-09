import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

GroupBox {

    property string nomeCliente: txtCliente.text
    property string celularCliente: txtCelular.text
    property var nTitle

    id: nomeG
    Layout.fillWidth: true
    Layout.preferredHeight: vendedorGroup.height
    title: nTitle

    font.pointSize: fGSize - 1
    padding: padGroup
    topPadding: 25
    bottomPadding: 5
    rightPadding: 5
    leftPadding: 5

    RowLayout {
        anchors.fill: parent
        spacing: 5

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true

            color: "transparent"

            TextField {
                id: txtCliente
                text: ""
                font.pointSize: fTSize - 1
                placeholderText: "Nome do cliente"
                anchors.fill: parent
                anchors.rightMargin: 8
                anchors.leftMargin: 8
                padding: 2
                rightPadding: 2
                leftPadding: 2
                bottomPadding: 2
                topPadding: 2
                background: null
                selectByMouse: true

            }
        }

        ToolSeparator {
            id: toolSeparator
            rightPadding: 2
            leftPadding: 2
            Layout.fillHeight: true
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true

            color: "transparent"

            TextField {
                id: txtCelular
                anchors.fill: parent
                text: ""
                placeholderText: " Ex: (44) 99978-9953"
                font.pointSize: fTSize - 1
                background: null
                selectByMouse: true

                anchors.rightMargin: 8
                anchors.leftMargin: 8
                padding: 2
                rightPadding: 2
                leftPadding: 2
                bottomPadding: 2
                topPadding: 2

                onActiveFocusChanged:{
                           inputMask="(99) 99999-9999"
                   }

                inputMethodHints: Qt.ImhFormattedNumbersOnly | Qt.ImhNoPredictiveText
            }
        }
    }

    Component.onCompleted: {
        txtCelular.font.pointSize = 8
        txtCliente.font.pointSize = 8
        txtCelular.font.pointSize = (fTSize - 1)
        txtCliente.font.pointSize = (fTSize - 1)
    }
}
