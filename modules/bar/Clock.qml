import QtQuick
import QtQuick.Layouts

import qs.components
import qs.data
import qs.data.theme

Item {
	Layout.fillWidth: true

	ColumnLayout {
		anchors {
			verticalCenter: parent.verticalCenter
			left: parent.left
			right: parent.right
		}

		Text {
			text: DateTime.date
			font: Fonts.title.md
			color: Theme.color.on_surface
			horizontalAlignment: Text.AlignHCenter
			Layout.alignment: Qt.AlignHCenter
		}

		Separator {}

		Text {
			text: DateTime.time
			font: Fonts.title.md
			color: Theme.color.on_surface
			horizontalAlignment: Text.AlignHCenter
			Layout.alignment: Qt.AlignHCenter
		}
	}
}
