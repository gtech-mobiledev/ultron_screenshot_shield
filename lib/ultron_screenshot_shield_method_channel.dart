import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ultron_screenshot_shield_platform_interface.dart';

/// An implementation of [UltronScreenshotShieldPlatform] that uses method channels.
class MethodChannelUltronScreenshotShield
    extends UltronScreenshotShieldPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ultron_screenshot_shield');

  @override
  Future<bool?> disableScreenshot() async {
    final result = await methodChannel.invokeMethod<bool>('disableScreenshot');
    return result;
  }

  @override
  Future<bool?> enableScreenshot() async {
    final result = await methodChannel.invokeMethod<bool>('enableScreenshot');
    return result;
  }
}
