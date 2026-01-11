pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
	readonly property var body: {
		"md": {
			"family": "Playpen Sans",
			"pointSize": 14
		}
	}
	readonly property var title: {
		"md": {
			"family": "Playpen Sans",
			"pointSize": 17,
			"bold": true
		}
	}
	readonly property var display: {
		"md": {
			"family": "Cattie",
			"pointSize": 22
		}
	}
}
