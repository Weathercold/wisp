import QtQuick

Text {
	property int codePoint
	property int size: 32

	text: String.fromCodePoint(codePoint)
	font {
		family: "Material Symbols Rounded"
		pixelSize: size
	}
}
