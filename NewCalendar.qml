import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import Qt.labs.calendar 1.0

Item {
    Column {
        id: row
        anchors.centerIn: parent
        spacing: 8

        Row {
            width: parent
            spacing: 20
            Button {
                width: 30
                text: "<"
            }
            Text {
                text: "Декабрь"
            }
            Button {
                width: 30
                text: ">"
            }
        }

        DayOfWeekRow {
        }

        MonthGrid {
            month: Calendar.December
        }
    }
}

