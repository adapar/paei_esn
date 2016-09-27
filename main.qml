import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    color: "#bfbfbf"
    title: qsTr("Expectativa sobre nada")
    visibility: "FullScreen"

    ColumnLayout {
        id: columnLayout1
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent

        Label {
            id: label2
            x: 253
            y: 353
            text: qsTr("toca cada cuadro y escucha")
            font.bold: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        RowLayout {
            id: rowLayout1
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                id: buttonWhite
                Layout.fillHeight: true
                Layout.fillWidth: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        theSound.stop()
                        theSound.play()
                    }
                }
            }

            Rectangle {
                id: buttonBlack
                color: "#000000"
                Layout.fillHeight: true
                Layout.fillWidth: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        theSound.stop()
                        theSound.play()
                    }
                }
            }
        }

        Label {
            id: label1
            text: qsTr("describe los sonidos")
            font.bold: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        TextArea {
            id: whatDoYouThink
            height: 150
            text: qsTr("")
            Layout.maximumHeight: 150
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Rectangle {
            id: button1
            height: 40
            color: "#d2d2d2"
            radius: 10
            Layout.maximumWidth: 100
            Layout.fillHeight: false
            border.width: 2
            width: 100
            Label {
                text: qsTr("guardar")
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }


    }

    SoundEffect {
        id: theSound
        source: "media/sound.wav"
    }



}
