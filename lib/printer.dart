import 'package:oxidized/oxidized.dart';

import 'printer_platform_interface.dart';

class Printer {
  static Future<Result<Unit, String>> print() {
    return PrinterPlatform.instance.print();
  }
}
