import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ultron_screenshot_shield_method_channel.dart';

abstract class UltronScreenshotShieldPlatform extends PlatformInterface {
  /// Constructs a UltronScreenshotShieldPlatform.
  UltronScreenshotShieldPlatform() : super(token: _token);

  static final Object _token = Object();

  static UltronScreenshotShieldPlatform _instance =
      MethodChannelUltronScreenshotShield();

  /// The default instance of [UltronScreenshotShieldPlatform] to use.
  ///
  /// Defaults to [MethodChannelUltronScreenshotShield].
  static UltronScreenshotShieldPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UltronScreenshotShieldPlatform] when
  /// they register themselves.
  static set instance(UltronScreenshotShieldPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> enableScreenshot();
  Future<bool?> disableScreenshot();
}
