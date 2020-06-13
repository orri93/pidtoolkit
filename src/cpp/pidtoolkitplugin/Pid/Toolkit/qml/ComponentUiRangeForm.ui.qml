import QtQuick 2.14
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.12

import Pid.Toolkit 1.0

ColumnLayout {

  property alias rangeFromField: rangeFromTextField
  property alias rangeToField: rangeToTextField

    DoubleValidator {
        id: doubleValidator
    }

    Label {
        id: rangeNameLabel
        color: Style.labelTextColor
        Layout.leftMargin: Style.labelLeftMargin
        font.pointSize: Style.labelFontPointSize
    }

    RowLayout {
        Label {
            id: rangeFromLabel
            text: qsTr("From: ")
            color: Style.labelTextColor
            Layout.leftMargin: Style.labelLeftMargin
            font.pointSize: Style.labelFontPointSize
        }
        TextField {
            id: rangeFromTextField
            Layout.preferredWidth: Style.preferredRangeInputWidth
            Layout.leftMargin: Style.inputTextLeftMargin
            color: acceptableInput ? Style.inputTextColor : Style.errorTextColor
            font.pointSize: Style.inputFontPointSize
            validator: doubleValidator
        }

        Label {
            id: rangeToLabel
            text: qsTr("To: ")
            color: Style.labelTextColor
            Layout.leftMargin: Style.labelLeftMargin
            font.pointSize: Style.labelFontPointSize
        }
        TextField {
            id: rangeToTextField
            Layout.preferredWidth: Style.preferredRangeInputWidth
            Layout.leftMargin: Style.inputTextLeftMargin
            color: acceptableInput ? Style.inputTextColor : Style.errorTextColor
            font.pointSize: Style.inputFontPointSize
            validator: doubleValidator
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#c0c0c0"}
}
##^##*/