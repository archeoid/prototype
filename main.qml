import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import prototype 1.0
import prototype.gui 1.0

Window {
    width: 640
    height: 480
    visible: true
    color: "#000000"
    title: qsTr("Prototype")


    GLRenderer {
        id: glrenderer
        guiModel: GUI
    }

    Text {
        id: fps
        x: 592
        y: 8
        color: "#ffffff"
        text: qsTr(glrenderer.fps.toString())
        anchors.right: parent.right
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        font.bold: true
        anchors.rightMargin: 8
    }

    RoundButton {
        id: moveButton
        x: 10
        y: 10
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/move.svg"
        checked: GUI.activeAction == 1
        onPressed: GUI.activeAction = 1
    }

    RoundButton {
        id: rotateButton
        x: 10
        y: 60
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/rotate.svg"
        checked: GUI.activeAction == 2
        onPressed: GUI.activeAction = 2
    }

    RoundButton {
        id: scaleButton
        x: 10
        y: 110
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/scale.svg"
        checked: GUI.activeAction == 3
        onPressed: GUI.activeAction = 3
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: { GUI.mousePos = Qt.point(mouse.x, mouse.y); mouse.accepted = false; }
        propagateComposedEvents: true

        //dont eat the events!
        onClicked: mouse.accepted = false;
        onPressed: mouse.accepted = false;
        onReleased: mouse.accepted = false;
        onDoubleClicked: mouse.accepted = false;
        onPressAndHold: mouse.accepted = false;
    }
}
