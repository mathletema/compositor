import QtQuick
import QtQuick.Window
import QtWayland.Compositor
import QtWayland.Compositor.XdgShell
import QtWayland.Compositor.WlShell
import QtWayland.Compositor.IviApplication
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

WaylandCompositor {
    WaylandOutput {
        sizeFollowsWindow: true
        window: Window {
            width: 480
            height: 480
            visible: true

            Image {
                id: background

                anchors.fill: parent
                fillMode: Image.Stretch
                source: "graphics/wallpaper.png"
                smooth: true

                // Time element
                Item {
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 12
                    // Time text
                    Text {
                        id: time
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 0
                        font.pixelSize: 26
                        fontSizeMode: Text.VerticalFit
                        font.bold: true
                        color: Qt.rgba(1, 1, 1, 1)
                        font.family: "HelveticaNeue"
                        //text: qsTr("09:41 AM")
                        text: new Date().toLocaleTimeString(Locale.ShortFormat)
                    }
                    // Time shadow
                    DropShadow {
                        anchors.fill: time
                        horizontalOffset: 0
                        verticalOffset: 4
                        radius: 2
                        color: "#80000000"
                        source: time
                    }
                }

                Item {
                    x: 0
                    y: 104
                    width: 480
                    height: 252

                    // List of icons
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
                                    onClicked: py.run_command(command)
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
                    }

                    
                }    

                               
                /**
                states: [
                    State {
                        name: "clicked"
                        PropertyChanges { target: myRect; color: "red" }
                    }
                ]
                **/ 

                Repeater {
                    model: shellSurfaces
                    ShellSurfaceItem {
                        shellSurface: modelData
                        onSurfaceDestroyed: shellSurfaces.remove(index)
                    }
                }
            }
        }
    }

    WlShell {
        onWlShellSurfaceCreated:
            shellSurfaces.append({shellSurface: shellSurface});
    }
    XdgShell {
        onToplevelCreated:
            shellSurfaces.append({shellSurface: xdgSurface});
    }
    IviApplication {
        onIviSurfaceCreated: {
            shellSurfaces.append({shellSurface: iviSurface});
        }
    }
    
    ListModel { id: shellSurfaces }
}


