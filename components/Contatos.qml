import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

RowLayout {
    property string nomeCliente: txtCliente.text
    property string celularCliente: txtCelular.text
    property var nTitle
    property var cTitle

    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 5

    Rectangle {
        Layout.preferredHeight: vendedorGroup.height
        Layout.fillWidth: true

        color: "transparent"

        GroupBox {
            id: nomeG
            anchors.fill: parent
            title: nTitle


            font.pointSize: fGSize - 1
            padding: padGroup
            topPadding: 25
            bottomPadding: 5
            rightPadding: 5
            leftPadding: 5
            spacing: 4

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

    }

    Rectangle {
        Layout.preferredHeight: vendedorGroup.height
        Layout.fillWidth: true

        color: "transparent"

        GroupBox {
            id: cellGroup
            anchors.fill: parent
            title: cTitle
            font.pointSize: fGSize
            padding: padGroup
            topPadding: 25
            bottomPadding: 5
            rightPadding: 5
            leftPadding: 5
            spacing: 4

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
