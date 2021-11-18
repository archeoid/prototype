import QtQuick 2.15
import QtQuick.Controls 2.12

import "../"

Rectangle {
    readonly property real buttonSize: 40
    property real gizmoSize: 60
    radius: 5
    width: 250
    height: buttonSize
    anchors.topMargin: {5 + (gizmoSize-buttonSize)/2}
    color: Constants.structureColor

    Row {
        property real space: {(parent.width-(buttonSize*3)-gizmoSize)/5}
        spacing: space
        leftPadding: space
        rightPadding: space

        Repeater {
            model: 3
            RoundButton {
                checkable: true
                radius: 5
                width: buttonSize
                height: buttonSize
            }
        }

        Rectangle {
            radius: {gizmoSize/2}
            y: {-(gizmoSize-buttonSize)/2}
            width: gizmoSize
            height: gizmoSize
            color: "#ffffff"
        }
    }
}
