import QtQuick 2.12
import QtQuick.Controls 2.12
import "../"
MenuBar {
    property real _size: Constants.menuBarSize
    height: _size
    contentHeight: _size

    delegate: MenuBarItem {
            id: menuBarItem
            implicitHeight: _size
            hoverEnabled: true
            contentItem: Text {
                text: menuBarItem.text
                font: menuBarItem.font
                opacity: enabled ? 1.0 : 0.3
                color: menuBarItem.hovered || menuBarItem.highlighted  ? Constants.darkTextColor : Constants.textColor
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: _size
                implicitHeight: _size
                opacity: enabled ? 1 : 0.3
                color: menuBarItem.hovered || menuBarItem.highlighted ?  Constants.accentColor : "transparent"
            }
    }

    background: Rectangle {
        implicitWidth: _size
        implicitHeight: _size
        color: Constants.highlightColor
    }
}
