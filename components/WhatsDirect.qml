import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import QtGraphicalEffects 1.0
import "../js/WhatsFunctions.js" as WhatsFunc

Pane {
    id: mainpane
    width: 540
    height: 720

    property bool compl: false
    property double fTSize: compl === true && mainpane.height * 0.015 > 12 ? mainpane.height*0.015 : 13
    property double fGSize: compl === true && mainpane.height * 0.012 > 10 ? mainpane.height*0.012 : 10
    property int padGroup: 8

    ColumnLayout {

        anchors.fill: parent

        RowLayout {
            id: nomes
            Layout.fillWidth: true
            Layout.preferredHeight: 75
            spacing: 5

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                GroupBox {
                    id: nameGroup
                    anchors.fill: parent
                    title: qsTr("Nome do Cliente")
                    font.pointSize: fGSize
                    padding: padGroup
                    topPadding: 25
                    bottomPadding: 5
                    rightPadding: 5
                    leftPadding: 5
                    spacing: 4

                    TextField {
                        id: txtCliente
                        anchors.fill: parent
                        text: qsTr("")
                        font.pointSize: fTSize
                        placeholderText: " Digite o nome do cliente"
                        background: null

                        anchors.rightMargin: 8
                        anchors.leftMargin: 8
                        padding: 2
                        rightPadding: 2
                        leftPadding: 2
                        bottomPadding: 2
                        topPadding: 2
                        selectByMouse: true
                    }

                }

            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                GroupBox {
                    anchors.fill: parent
                    title: qsTr("Nome do Vendedor")
                    font.pointSize: fGSize
                    padding: padGroup
                    topPadding: 25
                    bottomPadding: 5
                    rightPadding: 5
                    leftPadding: 5
                    spacing: 4

                    TextField {
                        id: txtVendedor
                        anchors.fill: parent
                        text: qsTr("")
                        placeholderText: " Digite o nome do vendedor"
                        font.pointSize: fTSize
                        background: null

                        anchors.rightMargin: 8
                        anchors.leftMargin: 8
                        padding: 2
                        rightPadding: 2
                        leftPadding: 2
                        bottomPadding: 2
                        topPadding: 2
                        selectByMouse: true
                    }
                }
            }
        }

        RowLayout {
            id: telefone
            Layout.fillWidth: true
            Layout.preferredHeight: 75
            spacing: 5

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                GroupBox {
                    id: cellGroup
                    anchors.fill: parent
                    title: qsTr("Celular do Cliente")
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
                        font.pointSize: fTSize
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

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                RowLayout {
                    anchors.fill: parent
                    spacing: 5

                    GroupBox {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        title: qsTr("Documentos Necessários")
                        font.pointSize: fGSize
                        padding: padGroup
                        topPadding: 25
                        bottomPadding: 5
                        rightPadding: 5
                        leftPadding: 5
                        spacing: 4

                        RadioDelegate {
                            id: chkDocumentos
                            anchors.fill: parent
                            autoExclusive: false
                            spacing: 0
                            display: AbstractButton.IconOnly
                        }
                    }

                    GroupBox {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        title: qsTr("Apartamento")
                        font.pointSize: fGSize
                        padding: padGroup
                        topPadding: 25
                        bottomPadding: 5
                        rightPadding: 5
                        leftPadding: 5
                        spacing: 4

                        RadioDelegate {
                            id: chkApartamento
                            anchors.fill: parent
                            autoExclusive: false
                            spacing: 0
                            display: AbstractButton.IconOnly
                        }
                    }
                }



            }

            Component.onCompleted: {
                txtCliente.font.pointSize = 10
                txtVendedor.font.pointSize = 10
                txtCliente.font.pointSize = fTSize
                txtVendedor.font.pointSize = fTSize

            }
        }

        GridLayout {
            id: tipoProposta
            //Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 140
            //implicitHeight: 140
            columns: 2

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.rowSpan: 2
                color: "transparent"

                GroupBox {
                    title: qsTr("Tipo de Proposta")
                    anchors.fill: parent
                    padding: padGroup
                    font.pointSize: fGSize
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.bottomMargin: -5
                        anchors.topMargin: -5
                        RadioDelegate {
                            id: chkFamiliar
                            text: qsTr("Familiar")
                            spacing: 0
                            font.pointSize: fTSize
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }

                        RadioDelegate {
                            id: chkEmpresarial
                            text: qsTr("Empresarial")
                            spacing: 0
                            Layout.fillHeight: true
                            font.pointSize: fTSize
                            Layout.fillWidth: true
                        }

                    }
                }

            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                GroupBox {
                    id: groupBox
                    title: qsTr("Quantidade de Pessoas")
                    anchors.fill: parent
                    padding: padGroup
                    spacing: 6
                    font.pointSize: fGSize

                    SpinBox {
                           id: qntPessoas
                           anchors.horizontalCenter: parent.horizontalCenter
                           anchors.verticalCenter: parent.verticalCenter
                           height: chkEmpresarial.height
                           bottomPadding: 5
                           topPadding: 5
                           width: parent.width / 1.3
                           to: 20
                           from: 1
                           value: 1
                           editable: true
                           font.pointSize: fTSize
                           background: null
                       }

                }

            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                GroupBox {
                    title: qsTr("Tabela de Associação")
                    anchors.fill: parent
                    padding: padGroup
                    font.pointSize: fGSize
                    opacity: chkEmpresarial.checked === true ? 1 : 0.2

                    RadioDelegate {
                        id: chkAssoc
                        text: qsTr("Associação")
                        anchors.bottomMargin: -5
                        anchors.topMargin: -5
                        anchors.fill: parent
                        spacing: 0
                        font.pointSize: fTSize
                        autoExclusive: false
                        visible: chkEmpresarial.checked === true ? true : false
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }
        }

        GroupBox {
            id: tipoPlano
            spacing: 6
            leftPadding: 12
            padding: 12
            Layout.fillWidth: true
            //Layout.fillHeight: true
            Layout.preferredHeight: 70
            title: qsTr("Tipo de Plano")
            font.pointSize: fGSize

            RowLayout {
                anchors.rightMargin: -5
                anchors.leftMargin: -5
                anchors.bottomMargin: -5
                anchors.topMargin: -5
                spacing: 0
                anchors.fill: parent

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"

                    RadioDelegate {
                        id: chkPlena
                        text: qsTr("Saúde Plena")
                        spacing: 4
                        padding: padGroup
                        anchors.fill: parent
                        font.pointSize: fTSize
                        autoExclusive: false
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

                    RadioDelegate {
                        id: chkPremium
                        text: chkEmpresarial.checked === true ? qsTr("Pro-Saúde") : qsTr("Saúde Premium")
                        spacing: 4
                        padding: padGroup
                        anchors.fill: parent
                        font.pointSize: fTSize
                        autoExclusive: false
                    }
                }

                ToolSeparator {
                    id: toolSeparator1
                    rightPadding: 2
                    leftPadding: 2
                    Layout.fillHeight: true
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"

                    RadioDelegate {
                        id: chkPerfeita
                        text: qsTr("Saúde Perfeita")
                        spacing: 4
                        padding: padGroup
                        anchors.fill: parent
                        font.pointSize: fTSize
                        autoExclusive: false
                    }
                }

            }

        }

        GroupBox {
            id: idadesBox
            padding: 8
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 250
            font.pointSize: fGSize

            title: qsTr("Idades das pessoas")

            Flickable {
                id: flickview
                anchors.fill: parent
                contentHeight: idadesGrid.implicitHeight
                clip: true

                GridLayout {
                    id: idadesGrid
                    anchors.top: parent.top
                    anchors.topMargin: -2
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    rowSpacing: 6
                    columnSpacing: 10
                    columns: 2

                    Repeater {
                        property int myModel: qntPessoas.value
                        id: idadeRepeat
                        model: myModel

                        Idades {
                            gTitle: index == 0 ? "Titular" : "Dependente " + index
                            obsTitle:
                            {
                               if (index > 0 && chkFamiliar.checked === true) {
                                   idadeRepeat.itemAt(0).obsTitle
                               } else {
                                   chkObs === true ? "C/ Obs" : "S/ Obs"
                               }
                            }

                            obsVisible: index < 1 || chkEmpresarial.checked === true ? true : false
                            obsOpacity: index < 1 || chkEmpresarial.checked === true ? 1 : 0.2
                        }
                    }
                }

                ScrollBar.vertical: ScrollBar {
                    //policy: ScrollBar.AsNeeded
                    policy: flickview.contentHeight > flickview.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
                }
            }       
        }

        GroupBox {
            id: exportar
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            title: qsTr("Enviar orçamento")
            font.pointSize: fGSize
            anchors.bottomMargin: -5
            anchors.topMargin: -5
            padding: padGroup

            RowLayout {
                anchors.fill: parent

                Bexport {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    toolTip: "Enviar para Whatsapp"
                    imagSource: "../icons/Whatsapp-Classico.svg"

                    bdesaturation: 0

                    onClicked: {
                        chkFamiliar.checked===true ? chkAssoc.checked = false : 0

                        var nomeCliente = txtCliente.text
                        var nomeVendedor = txtVendedor.text

                        var idadesObsLista = []

                        var ipessoas = qntPessoas.value
                        var index = 0
                        while (ipessoas > 0) {
                            var idadesLista = []

                            if (idadeRepeat.itemAt(index).idades === ""){
                                idadesLista.push(0)
                            }else{
                                idadesLista.push(idadeRepeat.itemAt(index).idades)
                            }
                            if (chkFamiliar.checked === true){
                                idadesLista.push(idadeRepeat.itemAt(0).chkObs === true ? "C/ Obs" : "S/ Obs")
                            }else{
                                idadesLista.push(idadeRepeat.itemAt(index).chkObs === true ? "C/ Obs" : "S/ Obs")
                            }

                            idadesObsLista.push(idadesLista)
                            index ++
                            ipessoas --
                        }

                        var tProposta = chkAssoc.checked === true ? "Associação" : chkEmpresarial.checked === true ? "Empresarial" : "Familiar"

                        var tPlano = []
                        chkPlena.checked === true ? tPlano.push(chkPlena.text) : 0
                        chkApartamento.checked === true ? tPlano.push("Apartamento") : 0
                        chkPremium.checked === true ? tPlano.push(chkPremium.text) : 0
                        chkPerfeita.checked === true ? tPlano.push(chkPerfeita.text) : 0

                        var celular = txtCelular.text.replace(/\D/g,'')

                        var documentos = chkDocumentos.checked

                        WhatsFunc.orçamento(nomeCliente,nomeVendedor,idadesObsLista,tProposta,tPlano,celular,documentos)

                    }
                }

                Bexport {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    toolTip: "Mala Direta"
                    imagSource: "../icons/Whatsapp-Massa.svg"

                    bdesaturation: 1

                    onClicked: {
                        pane.visible = false
                        pane2.visible = true
                        pageName = "Mala Direta"
                    }
                }

                Bexport {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    toolTip: "Enviar por Email"
                    imagSource: "../icons/Mail-Azul.svg"

                    bdesaturation: 1
                }
            }
        }
    }

    Component.onCompleted: {
        compl = true
        txtCliente.font.pointSize = 10
        txtVendedor.font.pointSize = 10
        txtCelular.font.pointSize = 10
        txtCliente.font.pointSize = fTSize
        txtVendedor.font.pointSize = fTSize
        txtCelular.font.pointSize = fTSize
        chkFamiliar.checked = true
    }
}
