import Quickshell

import qs.components

Variants {
	model: Quickshell.screens

	PanelWindow {
		required property var modelData

		screen: modelData
		exclusionMode: ExclusionMode.Ignore
		mask: Region {} // Always pass clicks to underlying window
		color: "transparent"
		anchors {
			top: true
			bottom: true
			left: true
			right: true
		}

		RoundCorner {
			corner: RoundCorner.CornerEnum.TopRight
		}
		RoundCorner {
			corner: RoundCorner.CornerEnum.BottomRight
		}
		RoundCorner {
			corner: RoundCorner.CornerEnum.BottomLeft
		}
		RoundCorner {
			corner: RoundCorner.CornerEnum.TopLeft
		}
	}
}
