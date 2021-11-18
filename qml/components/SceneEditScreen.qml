import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

import prototype 1.0
import prototype.gui 1.0

import "../"

Item {
    ContextPanel {
        id: contextPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: contextDrag.left
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5
    }

    ContextDrag {
        id: contextDrag
    }

    CameraControls {
        id: cameraControls
        anchors.right: contextDrag.left
        anchors.top: parent.top
        anchors.rightMargin: 5
    }

    ActionBar {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    Text {
        id: fps
        color: Constants.textColor
        text: qsTr(glrenderer.fps.toString())
        anchors.top: cameraControls.bottom
        anchors.right: contextDrag.left
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        anchors.rightMargin: 10
        anchors.topMargin: 10
        font.bold: true
    }
}
