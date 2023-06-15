import 'dart:io';

class PlatformCheck {
  static bool isEmulator() {
    bool isEmulator = false;
    if (Platform.isAndroid) {
      isEmulator = !Platform.environment.containsKey('SERVICE_NAME');
    } else if (Platform.isIOS) {
      isEmulator =
          !Platform.environment.containsKey('SIMULATOR_RUNTIME_VERSION');
    }
    return isEmulator;
  }
}
