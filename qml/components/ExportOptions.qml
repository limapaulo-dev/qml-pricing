import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Rectangle {

    id: exportmain

    color: topbanner.color
    radius: 5


    RowLayout {

        anchors.fill: parent


        Rectangle {

            color: "transparent"

            Layout.fillWidth: true
            Layout.fillHeight: true

            Image {
                anchors.centerIn: parent
                sourceSize.width: parent.height * 0.6
                sourceSize.height: parent.height * 0.6

                source: "../../Icons/Whatsapp-Classico.svg"
            }

        }

        Rectangle {

            color: "transparent"

            Layout.fillWidth: true
            Layout.fillHeight: true

            Image {
                anchors.centerIn: parent
                sourceSize.width: parent.height * 0.6
                sourceSize.height: parent.height * 0.6

                source: "../../Icons/Mail-Azul.svg"
            }

        }

        Rectangle {

            color: "transparent"

            Layout.fillWidth: true
            Layout.fillHeight: true


            Image {
                anchors.centerIn: parent
                sourceSize.width: parent.height * 0.3
                sourceSize.height: parent.height * 0.4

                source: "../../Icons/times.svg"

            }

        }

        Rectangle {

            color: "transparent"

            Layout.fillWidth: true
            Layout.fillHeight: true

            Image {
                anchors.centerIn: parent
                sourceSize.width: parent.height * 0.3
                sourceSize.height: parent.height * 0.4

                source: "../../Icons/times.svg"
            }

        }

    }
}
