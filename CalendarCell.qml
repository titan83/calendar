import QtQuick 2.5
import QtQuick.Layouts 1.1

Repeater {
    id: repeater
    property alias model: parent.model
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

