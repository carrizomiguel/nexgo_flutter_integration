import 'package:oxidized/oxidized.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'printer_method_channel.dart';

abstract class PrinterPlatform extends PlatformInterface {
  /// Constructs a PrinterPlatform.
  PrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrinterPlatform _instance = MethodChannelPrinter();

  /// The default instance of [PrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelPrinter].
  static PrinterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PrinterPlatform] when
  /// they register themselves.
  static set instance(PrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Result<Unit, String>> print() {
    throw UnimplementedError('print() has not been implemented.');
  }
}
