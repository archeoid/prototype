import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import prototype 1.0
import prototype.gui 1.0

import "style"
import "components"

ApplicationWindow {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#000000"
    title: qsTr("Prototype")

    MouseCapture {
        onPositionChanged: { GUI.mousePos = Qt.point(mouse.x, mouse.y); mouse.accepted = false; }
    }

    GLRenderer {
        id: glrenderer
        anchors.fill: parent
        guiModel: GUI
    }

    SceneEditScreen {
        anchors.fill: parent
    }

    menuBar: SettingsBar {

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:2}D{i:1}D{i:3}
}
##^##*/
