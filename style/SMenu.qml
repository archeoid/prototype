import QtQuick 2.12
import QtQuick.Controls 2.12
import "../"
Menu {
    topPadding: 4
    bottomPadding: 4
    delegate: MenuItem {
        id: menuItem
        implicitWidth: 200
        implicitHeight: Constants.menuBarSize
        hoverEnabled: true

        contentItem: Text {
            text: menuItem.text
            font: menuItem.font
            opacity: enabled ? 1.0 : 0.3
            color: menuItem.hovered ? Constants.darkTextColor : Constants.textColor
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            implicitWidth: 200
            implicitHeight: _size
            opacity: enabled ? 1 : 0.3
            color: menuItem.hovered ? Constants.accentColor : "transparent"
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: _size
        color: Constants.structureColor
        radius: 2
    }


}
