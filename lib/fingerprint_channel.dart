// ignore_for_file: avoid_print

import 'package:flutter/services.dart';

class FingerprintChannel {
  static const MethodChannel _channel = MethodChannel('fingerprint');

  static Future<bool> authenticate() async {
    try {
      final bool result = await _channel.invokeMethod('authenticate');
      return result;
    } on PlatformException catch (e) {
      print("Failed to authenticate: '${e.message}'.");
      return false;
    }
  }
}
