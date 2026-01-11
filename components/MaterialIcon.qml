import QtQuick

Text {
	enum Style {
		Outlined,
		Rounded,
		Sharp
	}

	property int codePoint
	property int size: 32
	property var style: MaterialIcon.Style.Rounded
	property bool filled: false

	text: String.fromCodePoint(codePoint)
	font {
		family: "Material Symbols " + Qt.enumValueToString(MaterialIcon.Style, style)
		pixelSize: size
		variableAxes: {
			"FILL": filled
		}
	}
}
