import QtQuick 2.15
import QtQuick.Controls 2.12
import prototype 1.0
import prototype.gui 1.0

import "../"

Column {
    readonly property real buttonSize: 50
    id: actionColumn
    width: buttonSize
    height: 400

    property real space: {(actionColumn.height-(buttonSize*6))/7}
    spacing: space
    topPadding: space
    bottomPadding: space

    ActionButton {
        guiAction: GUI.ACTION_MOVE
        icon.source: "qrc:/images/move_icon.svg"
    }
    ActionButton {
        guiAction: GUI.ACTION_ROTATE
        icon.source: "qrc:/images/rotate_icon.svg"
    }
    ActionButton {
        guiAction: GUI.ACTION_SCALE
        icon.source: "qrc:/images/scale_icon.svg"
    }
    ActionButton {
        guiAction: GUI.ACTION_MIRROR
        icon.source: "qrc:/images/mirror_icon.svg"
    }
    ActionButton {
        guiAction: GUI.ACTION_GROUND
        icon.source: "qrc:/images/ground_icon.svg"
    }
    ActionButton {
        guiAction: GUI.ACTION_GRID_SUPPORT
        icon.source: "qrc:/images/grid_support_icon.svg"
    }

    ButtonGroup {
        buttons: actionColumn.children
    }
}
