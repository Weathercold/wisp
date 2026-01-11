import QtQml
import QtQuick.Layouts
import Quickshell.Services.UPower

import qs.components
import qs.data.theme

MaterialIcon {
	enum IconStyle {
		Vertical,
		Horizontal,
		HorizontalFrame
	}

	property var styles: Battery.IconStyle.HorizontalFrame

	// Battery level from 0 to 7
	readonly property int level: Math.ceil(UPower.displayDevice.percentage * 8) - 1
	readonly property bool isPlugged: UPower.displayDevice.state === UPowerDeviceState.Charging || UPower.displayDevice.state === UPowerDeviceState.FullyCharged

	text: getIcon()
	filled: level === 7
	color: Theme.color.primary
	visible: UPower.displayDevice.isLaptopBattery
	Layout.alignment: Qt.AlignHCenter

	function getIcon() {
		switch (styles) {
		case Battery.IconStyle.Vertical:
			if (isPlugged)
				switch (level) {
				case 0:
					return "battery_charging_full"
				case 1:
					return "battery_charging_20"
				case 2:
					return "battery_charging_30"
				case 3:
					return "battery_charging_50"
				case 4:
					return "battery_charging_60"
				case 5:
					return "battery_charging_80"
				case 6:
					return "battery_charging_90"
				case 7:
					return "battery_charging_full"
				}
			else
				switch (level) {
				case 0:
					return "battery_alert"
				case 7:
					return "battery_full"
				default:
					return `battery_${level}_bar`
				}
		case Battery.IconStyle.Horizontal:
			if (isPlugged)
				return "battery_android_bolt"
			else
				switch (level) {
				case 0:
					return "battery_android_alert"
				case 7:
					return "battery_android_full"
				default:
					return `battery_android_${level}`
				}
		case Battery.IconStyle.HorizontalFrame:
			if (isPlugged)
				return level === 7 ? "battery_android_frame_bolt" : "battery_android_bolt"
			else
				switch (level) {
				case 0:
					return "battery_android_alert"
				case 7:
					return "battery_android_frame_full"
				default:
					return `battery_android_frame_${level}`
				}
		}
	}
}
