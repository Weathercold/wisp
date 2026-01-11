import QtQuick

Text {
	enum Variant {
		Outlined,
		Rounded,
		Sharp
	}

	property int codePoint
	property int size: 32
	property var variant: MaterialIcon.Variant.Rounded
	property bool filled: false

	text: String.fromCodePoint(codePoint)
	font {
		// Qt.enumValueToString breaks Quickshell hot reload
		family: "Material Symbols " + (variant === MaterialIcon.Variant.Outlined ? "Outlined" : variant === MaterialIcon.Variant.Rounded ? "Rounded" : "Sharp")
		pixelSize: size
		variableAxes: {
			"FILL": filled
		}
	}
}
