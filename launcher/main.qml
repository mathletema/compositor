import QtQuick 2.0
import QtQuick.Window 2.15
import QtWayland.Compositor 1.15
import QtGraphicalEffects 1.15

import QtQuick 2.5
import QtQuick.Window 2.2

Window { // Must be this type to be loaded by QQmlApplicationEngine.
    visible: true
    width: 480
    height: 252
    flags: Qt.FramelessWindowHint
    color: "#00000000"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Item {
        x: 0; y:0
        width: 480; height: 252

        ListView {
            id: listView
            x: 0
            height: 252
            //height: 320
            width: 480
            
            orientation: ListView.Horizontal
            spacing: 56
            model: AppList {id: appList}
            
            //Only creates icons
            delegate: Component {
                Item {
                    x: 0
                    y: 0
                    width: 252
                    height: 320
                    MouseArea {
                        width: iconName.width
                        height: iconName.height
                        Image {
                            id: iconName
                            fillMode: Image.PreserveAspectFit
                            source: location
                            y: 0
                            height: 252
                        }
                        // onClicked: py.run_command(command)
                    }
                    Text {
                        id: textLabel
                        y: 288
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: label
                        font.pixelSize: 32
                    }
                }
            }
            
            preferredHighlightBegin: 240 - 126
            preferredHighlightEnd: 240 + 126
            highlightRangeMode: ListView.StrictlyEnforceRange

            flickDeceleration: 100000000
        }
    }
}