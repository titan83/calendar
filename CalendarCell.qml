import QtQuick 2.5
import QtQuick.Layouts 1.1

Repeater {
    id: repeater
    property int daysInMonth: new Date(showDate.getFullYear(), showDate.getMonth() + 1, 0).getDate()
    property int firstDay: {
        var day = new Date(showDate.getFullYear(), showDate.getMonth(), 1).getDay()
        day == 0 ? day = 6 : day -= 1
    }

    model: firstDay + daysInMonth
    Rectangle {
        property bool highLighted: false
        property color normalColor

        Component.onCompleted: {
            if (index < firstDay)
                normalColor = calendar.color = "white";
            else {
                if (isToday(index - firstDay))
                    normalColor = "yellow";
                else
                    normalColor ="#eeeeee"
            }
        }
        color: highLighted ? "grey" : normalColor
        Layout.preferredWidth: (calendar.width - 20 - 60)/7
        Layout.preferredHeight: (dateGrid.height - (dateLabels.rows - 1)*10)/dateLabels.rows
        Layout.fillWidth: true
        Layout.fillHeight: true

        Text {
            id: dateText
            color: highLighted?"yellow":"black"
            anchors.centerIn: parent
            text: index + 1 - firstDay
            opacity: (index < firstDay) ? 0 : 1
            font.bold: isToday(index - firstDay)  || highLighted
        }
        MouseArea {
            id: dateMouse
            enabled: index >= firstDay
            anchors.fill: parent
            onClicked: {
                selectedDate = new Date( showDate.getFullYear(), showDate.getMonth() + 1, index + 1 - firstDay).toLocaleDateString()
                if (dateGrid.currentActive != -1)
                    repeater.itemAt(dateGrid.currentActive).highLighted = false;
                if (!isToday(index - firstDay)) {
                    highLighted = true
                    dateGrid.currentActive = index
                }
            }
        }
    }
}
