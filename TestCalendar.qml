import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import Qt.labs.calendar 1.0

Rectangle {
    id: calendar
    width: 400;
    height: 300
    color: "#903030"

    property date today: new Date()
    property date showDate: new Date()
    property int daysInMonth: new Date(showDate.getFullYear(), showDate.getMonth() + 1, 0).getDate()
    property int firstDay: new Date(showDate.getFullYear(), showDate.getMonth(), 1).getDay()

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

    Item {
        id: dateLabels
        anchors.top: calendarTop.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        height: calendar.height - calendarTop.height - 20 - calendarTop.anchors.topMargin
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
                Repeater {
                    id: repeater
                    model: firstDay + daysInMonth
                    Rectangle {
                          property bool highLighted: false
                          property color normalColor

                          Component.onCompleted: {
                              if (index < firstDay)
                                  normalColor = calendar.color="green";
                              else {
                                  if (isToday(index-firstDay))
                                      normalColor = "yellow";
                                  else
                                      normalColor ="#eeeeee"
                              }
                          }
                          color: dateMouse.pressed ? "blue" : (highLighted ? "grey" : normalColor)
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
                                  var clickedDate = new Date( showDate.getFullYear(), showDate.getMonth() + 1, index + 1 - firstDay)
                                  if (dateGrid.currentActive != -1)
                                      repeater.itemAt(dateGrid.currentActive).highLighted = false;
                                  if (!isToday(index - firstDay)){
                                      highLighted = true
                                      dateGrid.currentActive = index
                                  }
                              }
                          }
                      }
                }
            }
        }
    }
}
