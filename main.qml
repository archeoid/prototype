import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import prototype 1.0
import prototype.gui 1.0

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#000000"
    title: qsTr("Prototype")

    GLRenderer {
        id: glrenderer
        anchors.fill: parent
        guiModel: GUI

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

    ArrangeScreen {
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:2}D{i:1}D{i:3}
}
##^##*/
