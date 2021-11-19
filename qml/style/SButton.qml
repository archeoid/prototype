import QtQuick 2.12
import QtQuick.Controls 2.12
import "../"

RoundButton {
    id: button
    background: Rectangle {
        implicitWidth: 50
        implicitHeight: 50
        opacity: enabled ? 1 : 0.3
        color: pressed ? Constants.darkAccentColor : (checked ? Constants.accentColor : Constants.buttonColor)
        border.width: 0
        radius: button.radius
    }
    icon.color: checked || pressed ? Constants.iconColorInvert : Constants.iconColor
}
