import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import Qt.labs.calendar 1.0

Rectangle {
    id: calendar
    width: 400;
    height: 400

    property date today: new Date()
    property date showDate: new Date()
    property string selectedDate

    function isToday(index) {
        if (today.getFullYear() != showDate.getFullYear())
            return false;
        if (today.getMonth() != showDate.getMonth())
            return false;

        return (index === today.getDate() - 1)
    }

    CalendarTop {
        id: calendarTop
    }
    Text {
        id: currentDate
        anchors.top: calendarTop.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.topMargin: 5
//        height: 20
        text: {
            var currentDate;
            if (selectedDate.length == 0)
                currentDate = "Выбранная дата:"
            else
                currentDate = ("Выбранная дата: %SelectedDate%").replace("%SelectedDate%", selectedDate)
        }
    }


    Item {
        id: dateLabels
        anchors.top: currentDate.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        height: calendar.height - calendarTop.height - currentDate.height - 20 - calendarTop.anchors.topMargin
        property int rows: 6

        DayOfWeekRow {
            id: dayLabels
            spacing: 40
            width: parent.width
            font { family: "Ubuntu"; pixelSize: 16 }
        }

        Item {
            id: dateGrid
            width: parent.width
            anchors.top: dayLabels.bottom
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            property int currentActive: -1
            GridLayout {
                columns: 7
                width: parent.width
                height: parent.height
                columnSpacing: 10
                rowSpacing: 10
                CalendarCell {}
            }
        }
    }
}
