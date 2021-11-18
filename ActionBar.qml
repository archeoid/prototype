import QtQuick 2.15
import QtQuick.Controls 2.12
import prototype 1.0
import prototype.gui 1.0
Column {
    id: actionColumn
    property real _size: 50
    width: _size
    height: 400

    property real space: {(actionColumn.height-(_size*6))/7}
    spacing: space
    topPadding: space
    bottomPadding: space

    RoundButton {
        width: _size
        height: _size
        id: moveButton
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/move.svg"
        checked: GUI.activeAction === 1
        onPressed: GUI.activeAction = 1
    }

    RoundButton {
        width: _size
        height: _size
        id: rotateButton
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/rotate.svg"
        checked: GUI.activeAction === 2
        onPressed: GUI.activeAction = 2
    }

    RoundButton {
        width: _size
        height: _size
        id: scaleButton
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/scale.svg"
        checked: GUI.activeAction === 3
        onPressed: GUI.activeAction = 3
    }

    RoundButton {
        width: _size
        height: _size
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/move.svg"
    }

    RoundButton {
        width: _size
        height: _size
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/rotate.svg"
    }

    RoundButton {
        width: _size
        height: _size
        checkable: true
        autoExclusive: true
        display: AbstractButton.IconOnly
        icon.source: "images/scale.svg"
    }

}
