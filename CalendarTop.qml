import QtQuick 2.0

Item {
    anchors.top: parent.top
    anchors.topMargin: 10
    width: parent.width
    height: childrenRect.height
    Image {
        id: monthPrev
        source: "Images/prev.png"
        anchors.left: parent.left
        anchors.leftMargin: 10
        MouseArea {
            anchors.fill: parent
            onClicked: showDate = new Date(showDate.getFullYear(), showDate.getMonth(), 0)
        }
    }
    Text {
        id: month
        color: "white"
        text: Qt.formatDateTime(showDate, "MMMM")
        font.bold: true
        anchors.left: monthPrev.right
    }
    Image {
        source: "Images/next.png"
        anchors.left: month.right
        MouseArea {
            anchors.fill: parent
            onClicked: showDate = new Date( showDate.getFullYear(), showDate.getMonth() + 1, 1)
        }
    }
    Image {
        id: yearPrev
        source: "Images/prev.png"
        anchors.right: currentYear.left
        MouseArea {
            anchors.fill: parent
            onClicked: showDate = new Date(showDate.getFullYear()-1,0)
        }
    }
    Text {
        id: currentYear
        color: "white"
        text: Qt.formatDateTime(showDate, "yyyy")
        font.bold: true
        anchors.right:yearNext.left
    }
    Image {
        id:yearNext
        source: "Images/next.png"
        anchors.right: parent.right
        anchors.rightMargin: 10
        MouseArea {
            anchors.fill: parent
            onClicked: showDate = new Date(showDate.getFullYear()+1, 1)
        }
    }
}
