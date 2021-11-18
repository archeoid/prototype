import QtQuick 2.12
import QtQuick.Controls 2.12

import "../style"
import "../"

SMenuBar {
    SMenu {
        title: qsTr("File")
        Action { text: qsTr("Thing 1");}
        Action { text: qsTr("Thing 2");}
        Action { text: qsTr("Thing 3");}
        SMenuSeperator {}
        Action { text: qsTr("Thing 4");}
    }
    SMenu {
        title: qsTr("Edit")
        Action { text: qsTr("Empty");}
    }
    SMenu {
        title: qsTr("View")
        Action { text: qsTr("Empty");}
    }
    SMenu {
        title: qsTr("Window")
        Action { text: qsTr("Empty");}
    }
    SMenu {
        title: qsTr("Help")
        Action { text: qsTr("Empty");}
    }
}
