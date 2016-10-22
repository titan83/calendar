import QtQuick 2.5

Item {
    anchors.top: parent.top
    anchors.topMargin: 10
    width: parent.width
    height: childrenRect.height
    Row {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        Image {
            source: "Images/prev.png"
            MouseArea {
                anchors.fill: parent
                onClicked: showDate = new Date(showDate.setMonth(showDate.getMonth() - 1))
            }
        }
        Text {
            width: 65
            height: parent.height
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: "gray"
            text: Qt.formatDateTime(showDate, "MMM")
        }
        Image {
            source: "Images/next.png"
            MouseArea {
                anchors.fill: parent
                onClicked: showDate = new Date(showDate.setMonth(showDate.getMonth() + 1))
            }
        }
        Image {
            source: "Images/prev.png"
            MouseArea {
                anchors.fill: parent
                onClicked: showDate = new Date(showDate.setFullYear(showDate.getFullYear() -1))
            }
        }
        Text {
            width: 65
            height: parent.height
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: "gray"
            text: Qt.formatDateTime(showDate, "yyyy")
        }
        Image {
            source: "Images/next.png"
            MouseArea {
                anchors.fill: parent
                onClicked: showDate = new Date(showDate.setFullYear(showDate.getFullYear() + 1))
            }
        }
    }
}
