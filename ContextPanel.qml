
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Item {
    id: contextArea

    Rectangle {
        id: contextBg
        color: Constants.structureColor
        radius: 5
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle {
            id: dragHighlight
            width: 10
            color: Constants.seperatorColor
            radius: 5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

        Rectangle {
            id: propertiesTitleBlock
            height: 41
            color: Constants.highlightColor
            radius: 5
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0

            Rectangle {
                color: Constants.highlightColor
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: 5
            }

            Text {
                id: propertiesTitle
                color: "#ffffff"
                text:  qsTr("Properties")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 16
                anchors.leftMargin: 10
                anchors.topMargin: 10
            }
        }

        ScrollView {
            id: lowerScrollView
            x: 0
            y: 361
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: seperatorV.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            clip: true
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AsNeeded
        }

        ScrollView {
            id: upperScrollView
            x: 0
            y: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: seperatorV.top
            anchors.leftMargin: 10
            anchors.bottomMargin: 0
            clip: true
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AsNeeded
        }
        Rectangle {
            id: seperatorV
            x: 0
            y: {contextArea.height / 2}
            height: 41
            color: Constants.highlightColor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0


            Text {
                id: sceneText
                color: "#ffffff"
                text:  qsTr("Scene")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 16
                anchors.leftMargin: 10
                anchors.topMargin: 10
            }

            MouseArea {
                id: dragAreaV
                anchors.fill: parent
                drag.target: parent
                drag.minimumY: 100
                drag.maximumY: contextArea.height - 100
            }
        }
    }
}
