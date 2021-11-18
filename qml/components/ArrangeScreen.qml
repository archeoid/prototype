import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

import prototype 1.0
import prototype.gui 1.0

import "../"

Item {
    id: contextArea
    ContextPanel {
        id: contextPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: seperatorH.left
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5
    }

    Rectangle {
        id: seperatorH
        width: 10
        color: "transparent"
        anchors.right: parent.right
        anchors.top: contextPanel.top
        anchors.bottom: contextPanel.bottom
        anchors.rightMargin: 200

        MouseArea {
            id: dragAreaH
            anchors.fill: parent
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            drag.target: parent

            drag.minimumX: window.width / 2
            drag.maximumX: window.width - 50

            //break right anchor
            onPressed: {
                parent.anchors.right = undefined
            }
            //recreate right anchor
            onReleased: {
                parent.anchors.rightMargin = contextArea.width-(parent.x+parent.width)
                parent.anchors.right = contextArea.right;
            }
        }
    }

    CameraControls {
        id: cameraControls
        anchors.right: seperatorH.left
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
        anchors.right: contextPanel.left
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        anchors.rightMargin: 10
        anchors.topMargin: 10
        font.bold: true
    }
}
