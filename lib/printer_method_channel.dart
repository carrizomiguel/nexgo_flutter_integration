import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:oxidized/oxidized.dart';

import 'printer_platform_interface.dart';

/// An implementation of [PrinterPlatform] that uses method channels.
class MethodChannelPrinter extends PrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final method = const MethodChannel('printer');

  @override
  Future<Result<Unit, String>> print() async {
    try {
      await method.invokeMethod<String>('print');
      return const Result.ok(unit);
    } on PlatformException catch (e) {
      return Result.err(e.message!);
    } catch (e, stacktrace) {
      log('nexgo FAILED ===> $e');
      log('nexgo FAILED ===> $stacktrace');
      return const Result.err('Algo falló!');
    }
  }
}
