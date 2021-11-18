import QtQuick 2.15
import QtQuick.Controls 2.12

Rectangle {
    property real _size: 40
    property real _gizmoSize: 60
    radius: 5
    width: 250
    height: _size
    anchors.topMargin: {5 + (_gizmoSize-_size)/2}
    color: Constants.structureColor

    Row {
        property real space: {(parent.width-(_size*3)-_gizmoSize)/5}
        spacing: space
        leftPadding: space
        rightPadding: space
        RoundButton {
            checkable: true
            radius: 5
            width: _size
            height: _size
        }
        RoundButton {
            checkable: true
            radius: 5
            width: _size
            height: _size
        }

        RoundButton {
            checkable: true
            radius: 5
            width: _size
            height: _size
        }

        Rectangle {
            radius: {_gizmoSize/2}
            y: {-(_gizmoSize-_size)/2}
            width: _gizmoSize
            height: _gizmoSize
            color: "#ffffff"
        }
    }
}
