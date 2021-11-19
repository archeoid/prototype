import QtQuick 2.0
import QtQuick.Controls 2.12
import prototype 1.0
import prototype.gui 1.0

import "../style"

SButton {
    readonly property real buttonSize: 50
    property int guiAction: GUI.ACTION_NONE
    width: buttonSize
    height: buttonSize
    checkable: true
    display: AbstractButton.IconOnly
    checked: GUI.activeAction === guiAction
    onPressed: GUI.activeAction = guiAction
}
