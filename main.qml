import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import QtShark.Window 1.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import "components"

ApplicationWindow {

    //property int wratio: Math.ceil(mainwindow.height * 3/4)
    //property int hratio: Math.ceil(mainwindow.width * 4/3)

    property string pageName

    id: mainwindow
    visible: true
    width: 540
    height: 720
    minimumWidth: 540
    minimumHeight: 720
    title: pageName + " - K-Vendas"
    Material.theme: Material.Dark
    Material.accent: Material.Indigo

    flags: Qt.Window | Qt.FramelessWindowHint

    FramelessHelper {
        id: framelessHelper

        Component.onCompleted: {
            addIncludeItem(topbanner)
            setTitleBarHeight(topbanner.height)
            addExcludeItem(topcontrols)
        }
    }

    ToolBar {
        id: topbanner
        height: 40
        width: parent.width
        anchors.top: parent.top


        Image {
            id: kIcon
            source: "../icons/kudoscode.svg"

            sourceSize.width: parent.height
            sourceSize.height: parent.height
            anchors.left: parent.left

        }

        Text {
            id: title

            anchors.left: kIcon.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 7
            anchors.bottomMargin: 7
            anchors.leftMargin: 5

            text: qsTr("Orçamento")
            color: "white"

            fontSizeMode: Text.VerticalFit
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            minimumPointSize: 10
            font.pointSize: 50


        }

    }

    RowLayout {
        id: topcontrols
        spacing: 0
        anchors.right: topbanner.right
        anchors.top: topbanner.top
        anchors.bottom: topbanner.bottom

        Bmin {
            id: bmin
        }

        Bmax {
            id: bmax
            isMaximized: Window.Maximized === mainwindow.visibility
        }

        Bclose {
            id: bclose

        }
    }

    RowLayout {
        width: parent.width
        height: parent.height - topbanner.height - lowbanner.height
        anchors.top: topbanner.bottom

        Rectangle {
            id: pane
            Layout.fillHeight: true
            Layout.fillWidth: true

            color: "transparent"

            opacity: visible ? 1.0 : 0.1
             Behavior on opacity {
               NumberAnimation  { duration: 1000 ; easing.type: Easing.InOutQuad  }
              }

             Whats {
                 anchors.fill: parent
             }
        }

        Rectangle {
            id: pane2
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: {Window.Maximized === mainwindow.visibility || mainwindow.width > 900}

            color: "transparent"

            opacity: visible ? 1.0 : 0.1
             Behavior on opacity {
               NumberAnimation  { duration: 1000 ; easing.type: Easing.InOutQuad  }
              }

            WhatsMDireta {
                 anchors.fill: parent
            }
        }
    }

    ToolBar {
        id: lowbanner
        width: parent.width
        height: topbanner.height * 0.7
        anchors.bottom: parent.bottom

        Text {
            //text: "Status"
            horizontalAlignment: Text.AlignLeft
            anchors.fill: parent
            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.leftMargin: 10

            font.pointSize: 100
            minimumPointSize: 10

            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.VerticalFit

            color: "white"

        }

        Text {
            id: timetext

            font.pointSize: 100
            minimumPointSize: 10

            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.VerticalFit

            color: "white"
            horizontalAlignment: Text.AlignRight

            anchors.fill: parent
            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.rightMargin: 10

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

    Component.onCompleted: {
        pane.visible === true ? pageName = "Orçamento" : ""
        mainwindow.x = Screen.width * 0.5 - 410
    }
}

