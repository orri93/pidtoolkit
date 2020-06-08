import QtQuick 2.4
import Pid.Toolkit 1.0
import Pid.Toolkit.Model 1.0 as Ptm

ControlRealSpinBoxForm {

  property var accuracyObject: null
  property real realValue: 0.0

  DoubleValidator {
    id: doubleValidatorNone
  }

  DoubleValidator {
    id: doubleValidatorBoth
    bottom: Math.min(from, to)
    top: Math.max(from, to)
  }

  DoubleValidator {
    id: doubleValidatorMinimum
    bottom: Math.min(from, to)
  }

  DoubleValidator {
    id: doubleValidatorMaximum
    top: Math.max(from, to)
  }

  onAccuracyObjectChanged: {
    if(accuracyObject) {
      realPrecision = accuracyObject.format.precision;
      realFrom = accuracyObject.number.range.from;
      realTo = accuracyObject.number.range.to;
      calculate(realPrecision);
      resolveUserInterface();
    }
  }

  onRealValueChanged: {
    refresh();
  }

  onValueChanged: {
    if(accuracyObject) {
      realValue = value / realMultiplier;
    }
  }

  textFromValue: function(value, locale) {
    return Number(value / realMultiplier).toLocaleString(
      locale, 'f', realPrecision)
  }

  valueFromText: function(text, locale) {
    return realMultiplier * Number.fromLocaleString(locale, text)
  }

  function refresh() {
    if(accuracyObject) {
      value = realMultiplier * realValue;
    }
  }

  function calculate(precision) {
    realMultiplier = Math.pow(10.0, realPrecision);
    realStepSize = 1.0 / realMultiplier;
    stepSize = realMultiplier * realStepSize;
    from = realMultiplier * realFrom;
    to = realMultiplier * realTo;
    console.log("Setting Precision to " + precision +
      " multiplier to " + realMultiplier +
      " step size to " + realStepSize);
  }

  function resolveUserInterface() {
    if(accuracyObject.number.restriction == Ptm.Restriction.Both) {
      validator = doubleValidatorBoth;
    } else if(accuracyObject.number.restriction == Ptm.Restriction.Minimum) {
      validator = doubleValidatorMinimum;
    } else if(accuracyObject.number.restriction == Ptm.Restriction.Maximum) {
      validator = doubleValidatorMaximum;
    } else {
      validator = doubleValidatorNone;
    }
  }

}

