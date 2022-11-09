import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
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
            Layout.preferredHeight: 60
            spacing: 5

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                GroupBox {
                    id: vendedorGroup
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
                           height: txtVendedor.height
                           bottomPadding: 5
                           topPadding: 5
                           width: parent.width / 1.3
                           to: 100
                           from: 1
                           value: 1
                           editable: true
                           font.pointSize: fTSize
                           background: null
                       }

                }

            }
        }

        GroupBox {
            id: idadesBox
            padding: 8
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 500
            font.pointSize: fGSize

            title: qsTr("Texto da mensagem")

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
                    columns: 1

                    Repeater {
                        id: idadeRepeat
                        model: qntPessoas.value

                        Contatos {

                            nTitle: "Cliente Nº " + (index + 1)
                            cTitle: "Celular do cliente Nº " + (index + 1) //Grupo de Celular


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
            title: qsTr("Tipos de Mensagem")
            font.pointSize: fGSize
            anchors.bottomMargin: -5
            anchors.topMargin: -5
            padding: padGroup

            RowLayout {
                anchors.fill: parent

                Bexport {
                    id: btelefone
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    toolTip: "Telefone de contato"
                    imagSource: "../icons/Whatsapp-Telefone.svg"

                    bdesaturation: 1

                    onClicked: {
                        btelefone.bdesaturation = 0
                        bsite.bdesaturation = 1
                        bindica.bdesaturation = 1

                    }

                }

                Bexport {
                    id: bsite
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    toolTip: "Simulação no site"
                    imagSource: "../icons/Whatsapp-Site.svg"

                    bdesaturation: 1

                    onClicked: {
                        btelefone.bdesaturation = 1
                        bsite.bdesaturation = 0
                        bindica.bdesaturation = 1

                    }

                }

                Bexport {
                    id: bindica
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    toolTip: "Indicação"
                    imagSource: "../icons/Whatsapp-Indicação.svg"

                    bdesaturation: 1

                    onClicked: {
                        btelefone.bdesaturation = 1
                        bsite.bdesaturation = 1
                        bindica.bdesaturation = 0

                    }
                }

            }
        }

        GroupBox {
            id: exportar2
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            title: qsTr("Exportar mensagem")
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

                    bdesaturation: 1

                    onClicked: {
                        pane.visible = true
                        pane2.visible = false
                        pageName = "Orçamento"
                    }

                }

                Bexport {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    toolTip: "Mala Direta"
                    imagSource: "../icons/Whatsapp-Massa.svg"

                    bdesaturation: 0

                    onClicked: {

                        var nomeVendedor = txtVendedor.text

                        var ipessoas = qntPessoas.value

                        if (btelefone.bdesaturation === 0){
                            var tipo = "Telefone"
                        } else if (bsite.bdesaturation === 0){
                            tipo = "Site"
                        } else {
                            tipo = "Indicação"
                        }

                        var listaClientes = []

                        var index = 0
                        while (ipessoas > 0) {
                            var cliente = []
                            if (idadeRepeat.itemAt(index).nomeCliente === ""){

                            }else{
                                cliente.push(idadeRepeat.itemAt(index).nomeCliente)
                                cliente.push(idadeRepeat.itemAt(index).celularCliente)
                            }
                            listaClientes.push(cliente)
                            index ++
                            ipessoas --
                        }

                        WhatsFunc.hello(nomeVendedor,listaClientes,tipo)

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


        Component.onCompleted: {
            compl = true
            txtVendedor.font.pointSize = 10
            txtVendedor.font.pointSize = fTSize
            qntPessoas.value = 3
            qntPessoas.value = 1
        }
    }

}
