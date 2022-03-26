import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1000
    height: 480
    visible: true

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "LeftState"

        Rectangle {
            id: leftRectangle
            Text {
                id: nameLeftRectangle
                anchors.centerIn: parent
                text: "move"
            }
            x: 100
            y: 200
            width: 100
            height: 100
            color: "lightgrey"
            border.color: "black"
            border.width: 2
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    if((scene.state=="LeftState" && ball.x==105) || scene.state=="OtherState") {
                        ball.x+=50
                    if(ball.x+ball.width>rightRectangle.x) {
                        scene.state="LeftState"
                    } else {
                        scene.state= "OtherState"
                    }
                    }
                }
            }
        }

        Rectangle {
            id: rightRectangle
            Text {
                id: nameRightRectangle
                anchors.centerIn: parent
                text: "return"
            }
            x: parent.width-100-rightRectangle.width
            y: 200
            width: 100
            height: 100
            color: "lightgrey"
            border.color: "black"
            border.width: 2
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state="LeftState"
            }
        }

        Rectangle {
            id: ball
            x: leftRectangle.x+5
            y: leftRectangle.y+5
            color: "darkgreen"
            border.width: 1
            border.color: "black"
            width: 90
            height: 90
            radius: width/2

        }

    states: [
        State {
            name: "LeftState"
            PropertyChanges {
                target: ball
                x: leftRectangle.x+5
            }
        },
        State {
            name: "OtherState"
            PropertyChanges {
                target: ball
                x: ball.x
            }
        }
        ]

        transitions: [
            Transition {
                from: "OtherState"
                to: "LeftState"
                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            },
            Transition {
                from: "LeftState"
                to: "OtherState"
                NumberAnimation {
                    properties: "x"
                    duration: 1
                }
            }
        ]

    }

}
