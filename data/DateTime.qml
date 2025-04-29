pragma Singleton

import QtQuick
import Quickshell

Singleton {
	readonly property var date: Qt.formatDate(clock.date, "MM\ndd")
	readonly property var time: Qt.formatTime(clock.date, "hh\nmm")

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}
}
