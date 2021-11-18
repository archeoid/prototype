import QtQuick 2.15
import QtQuick.Controls 2.12
import prototype 1.0
import prototype.gui 1.0

import "../"

Column {
    id: actionColumn
    property real buttonSize: 50
    width: buttonSize
    height: 400

    property real space: {(actionColumn.height-(buttonSize*6))/7}
    spacing: space
    topPadding: space
    bottomPadding: space

    RoundButton {
        width: buttonSize
        height: buttonSize
        id: moveButton
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/images/move.svg"
        checked: GUI.activeAction === 1
        onPressed: GUI.activeAction = 1
    }

    RoundButton {
        width: buttonSize
        height: buttonSize
        id: rotateButton
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/images/rotate.svg"
        checked: GUI.activeAction === 2
        onPressed: GUI.activeAction = 2
    }

    RoundButton {
        width: buttonSize
        height: buttonSize
        id: scaleButton
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/images/scale.svg"
        checked: GUI.activeAction === 3
        onPressed: GUI.activeAction = 3
    }

    RoundButton {
        width: buttonSize
        height: buttonSize
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/images/move.svg"
    }

    RoundButton {
        width: buttonSize
        height: buttonSize
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "../images/rotate.svg"
    }

    RoundButton {
        width: buttonSize
        height: buttonSize
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "qrc:/images/scale.svg"
    }

}
