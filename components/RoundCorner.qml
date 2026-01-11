/* Credit: end-4
   https://github.com/end-4/dots-hyprland/blob/main/dots/.config/quickshell/ii/modules/common/widgets/RoundCorner.qml
 */

import QtQuick
import QtQuick.Shapes

import qs.data.theme

Item {
	id: root

	enum Orientation {
		TopRight,
		BottomRight,
		BottomLeft,
		TopLeft
	}

	required property var corner
	property int implicitSize: 25
	property color color: Theme.color.scrim ?? "black"

	readonly property bool isTopRight: corner === RoundCorner.Orientation.TopRight
	readonly property bool isBottomRight: corner === RoundCorner.Orientation.BottomRight
	readonly property bool isBottomLeft: corner === RoundCorner.Orientation.BottomLeft
	readonly property bool isTopLeft: corner === RoundCorner.Orientation.TopLeft
	readonly property bool isTop: isTopLeft || isTopRight
	readonly property bool isRight: isTopRight || isBottomRight
	readonly property bool isBottom: isBottomLeft || isBottomRight
	readonly property bool isLeft: isTopLeft || isBottomLeft

	implicitWidth: implicitSize
	implicitHeight: implicitSize
	anchors {
		top: isTop ? parent.top : undefined
		right: isRight ? parent.right : undefined
		bottom: isBottom ? parent.bottom : undefined
		left: isLeft ? parent.left : undefined
	}

	Shape {
		id: shape

		layer {
			enabled: true
			smooth: true
		}
		preferredRendererType: Shape.CurveRenderer

		ShapePath {
			id: shapePath

			strokeWidth: 0
			fillColor: root.color
			pathHints: ShapePath.PathSolid & ShapePath.PathNonIntersecting

			startX: root.isLeft ? 0 : root.implicitSize
			startY: root.isTop ? 0 : root.implicitSize

			PathAngleArc {
				moveToStart: false
				centerX: root.implicitSize - shapePath.startX
				centerY: root.implicitSize - shapePath.startY
				radiusX: root.implicitSize
				radiusY: root.implicitSize
				startAngle: root.corner * 90 - 90
				sweepAngle: 90
			}

			PathLine {
				x: shapePath.startX
				y: shapePath.startY
			}
		}
	}
}
