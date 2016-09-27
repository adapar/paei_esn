import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Expectativa sobre nada")

    SoundEffect {
        id: theSound
        source: "media/sound.wav"
    }

    Button {
        id: buttonWhite
        text: qsTr("blanco")
        onClicked: {
            theSound.stop()
            theSound.play()
        }
    }

    Button {
        id: buttonBlack
        text: qsTr("negro")
        onClicked: {
            theSound.stop()
            theSound.play()
        }
    }
}
