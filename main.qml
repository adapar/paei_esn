import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.5

import net.adapar.uc.paei.qml 1.0

ApplicationWindow {    
    id: theApp

    property bool playing: false
    property Expectation expectation: null;

    visible: true
    width: 640
    height: 480
    color: "#bfbfbf"
    title: qsTr("")
    visibility: "FullScreen"

    function reset() {
        if (expectation != null) {
            expectation.destroy()
        }
        expectation = Qt.createQmlObject("import net.adapar.uc.paei.qml 1.0; Expectation { }", theApp, "expectationReset")
    }

    function playSound() {
        console.debug("PLAY")
        toggleEnabled(false)
        playing = true
        theTimer.running = true
    }

    function stopSound() {
        console.debug("STOP")
        toggleEnabled(true)
        playing = false
    }

    function toggleEnabled(value) {
        buttonWhite.enabled = value
        buttonBlack.enabled = value
        buttonSave.enabled = value
        whatDoYouThink.enabled = value
    }

    Component.onCompleted: {
        reset();
    }

    Timer {
        id: theTimer
        interval: 2000
        running: false
        repeat: false
        triggeredOnStart: false
        onTriggered: {
            console.debug("TIMEOUT")
            stopSound()
        }
    }

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
            text: playing ? qsTr("escucha") : qsTr("haz click en cada cuadrado y escucha")
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
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        expectation.whiteIncrement()
                        playSound()
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
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        expectation.blackIncrement()
                        playSound()
                    }
                }
            }
        }

        Label {
            id: label1
            text: qsTr("describe qué escuchas cuando haces click en el cuadrado blanco y en el cuadrado negro")
            font.bold: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Rectangle {
            height: 150
            color: "#f0f0f0"
            border.width: 2
            Layout.maximumHeight: 150
            Layout.fillWidth: true
            Layout.fillHeight: true

            Flickable {
                id: flickable1
                anchors.fill: parent

                TextArea.flickable: TextArea {
                    id: whatDoYouThink
                    wrapMode: TextArea.Wrap
                }

                ScrollBar.vertical: ScrollBar { }
            }
        }

        Rectangle {
            id: buttonSave
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
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("SAVING...")
                    if (expectation == null) {
                        console.error("Expectation not found")
                    } else {
                        expectation.description = whatDoYouThink.text
                        expectation.save()
                        whatDoYouThink.text = ""
                    }
                }
                onPressed: {
                    buttonSave.color = "#f4f4f4"
                }
                onReleased: {
                    buttonSave.color = "#d2d2d2"
                }
            }
        }
    }

}
