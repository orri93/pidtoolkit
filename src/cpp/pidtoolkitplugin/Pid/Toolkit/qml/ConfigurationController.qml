import QtQuick 2.14
import Pid.Toolkit 1.0

ConfigurationControllerForm {

  property var controller: null

  onControllerChanged: {
    if(controller) {
    }
  }
}