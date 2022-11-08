import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import QtShark.Window 1.0
import QtQuick.Layouts 1.3
import "components"

ApplicationWindow {

    //property int wratio: Math.ceil(mainwindow.height * 3/4)
    //property int hratio: Math.ceil(mainwindow.width * 4/3)

    id: mainwindow
    visible: true
    width: 480
    height: 640
    minimumWidth: 480
    minimumHeight: 640
    title: "Orçamento"

    flags: Qt.Window | Qt.FramelessWindowHint

    FramelessHelper {
        id: framelessHelper

        Component.onCompleted: {
            addIncludeItem(topbanner)
            setTitleBarHeight(topbanner.height)
            addExcludeItem(topcontrols)
        }
    }

    ColumnLayout {

        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: topbanner
            Layout.fillWidth: true
            Layout.preferredHeight: 40

            color: "Purple"

            Image {
                id: kIcon
                source: "../Icons/kudoscode.svg"

                sourceSize.width: parent.height
                sourceSize.height: parent.height
                anchors.left: parent.left

            }

            Text {
                id: title
                text: qsTr("Modulo : Orçamento")
                font.pointSize: parent.height / 3
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.HorizontalFit

                color: "white"

                anchors.left: kIcon.right
                anchors.margins: 5
                anchors.verticalCenter: parent.verticalCenter


            }

            Row {
                id: topcontrols
                anchors.top: topbanner.top
                anchors.right: topbanner.right

                height: parent.height

                Bmin {
                    id: bmin
                    onClicked: showMinimized()
                }

                Bmax {
                    id: bmax
                    isMaximized: Window.Maximized === mainwindow.visibility
                    onClicked: {
                        if (Window.Maximized === mainwindow.visibility) {
                            showNormal()
                        } else {
                            showMaximized()
                        }
                    }
                }

                Bclose {
                    id: bclose
                    onClicked: close()
                }

            }

        }

        Rectangle {
            id: workarea

            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.margins: 5

            ColumnLayout {

                anchors.fill: parent
                spacing: 5

                WhatsPage {
                    id: mainscreen
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Layout.preferredHeight: parent.height * 0.80

                }

                ExportOptions {

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Layout.preferredHeight: parent.height * 0.20

                }
            }
        }

        Rectangle {
            id: lowbanner
            Layout.fillWidth: true
            Layout.preferredHeight: topbanner.height * 0.6
            color: topbanner.color

            Text {
                text: "Status"

                font.pointSize: parent.height / 2.5
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.HorizontalFit

                color: "white"

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 25
            }

            Text {
                id: timetext

                font.pointSize: parent.height / 2.5
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.HorizontalFit

                color: "white"

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 25

                Timer {
                    interval: 500
                    running: true
                    repeat: true

                    onTriggered: {
                        var date = new Date()
                        timetext.text = date.toLocaleTimeString(Qt.locale("pt_BR"), "hh:mm")

                    }

                }
            }

        }

    }




    Component.onCompleted: {
        mainwindow.x = Screen.width * 0.5 - 410
    }

}
