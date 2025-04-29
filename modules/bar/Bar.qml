import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Services.UPower

import qs.components
import qs.data.theme

Variants {
	model: Quickshell.screens

	PanelWindow {
		required property var modelData

		screen: modelData
		anchors {
			top: true
			bottom: true
			left: true
		}
		color: "transparent"

		Rectangle {
			radius: 12
			color: Theme.color.surface_container_low
			anchors {
				fill: parent
				margins: 16
			}
			layer {
				enabled: true
				effect: MultiEffect {
					shadowEnabled: true
					shadowColor: Theme.color.shadow
				}
			}

			// MARK: Top

			ColumnLayout {
				anchors {
					top: parent.top
					left: parent.left
					right: parent.right
					topMargin: 16
					leftMargin: 12
					rightMargin: 12
				}

				MaterialIcon {
					text: "ac_unit"
					color: Theme.color.primary
					Layout.alignment: Qt.AlignHCenter
				}
			}

			// MARK: Center

			ColumnLayout {
				anchors {
					verticalCenter: parent.verticalCenter
					left: parent.left
					right: parent.right
					leftMargin: 12
					rightMargin: 12
				}

				Clock {}
			}

			// MARK: Bottom

			ColumnLayout {
				anchors {
					bottom: parent.bottom
					left: parent.left
					right: parent.right
					bottomMargin: 16
					leftMargin: 12
					rightMargin: 12
				}

				Tray {}

				MaterialIcon {
					text: "bluetooth"
					color: Theme.color.primary
					Layout.alignment: Qt.AlignHCenter
				}

				MaterialIcon {
					text: "wifi"
					color: Theme.color.primary
					Layout.alignment: Qt.AlignHCenter
				}

				MaterialIcon {
					text: "battery_0_bar"
					color: Theme.color.primary
					visible: UPower.onBattery
					Layout.alignment: Qt.AlignHCenter
				}

				MaterialIcon {
					text: "power_settings_new"
					color: Theme.color.error
					Layout.alignment: Qt.AlignHCenter
				}
			}
		}
	}
}
