import 'package:flutter_test/flutter_test.dart';
import 'package:ultron_screenshot_shield/ultron_screenshot_shield.dart';
import 'package:ultron_screenshot_shield/ultron_screenshot_shield_platform_interface.dart';
import 'package:ultron_screenshot_shield/ultron_screenshot_shield_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUltronScreenshotShieldPlatform
    with MockPlatformInterfaceMixin
    implements UltronScreenshotShieldPlatform {
  @override
  Future<bool?> disableScreenshot() {
    return Future.value(true);
  }

  @override
  Future<bool?> enableScreenshot() {
    return Future.value(true);
  }
}

void main() {
  final UltronScreenshotShieldPlatform initialPlatform =
      UltronScreenshotShieldPlatform.instance;

  test('$MethodChannelUltronScreenshotShield is the default instance', () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelUltronScreenshotShield>(),
    );
  });

  test('enableScreenshot', () async {
    MockUltronScreenshotShieldPlatform fakePlatform =
        MockUltronScreenshotShieldPlatform();
    UltronScreenshotShieldPlatform.instance = fakePlatform;

    expect(await UltronScreenshotShield.enableScreenshot(), true);
  });
  test('disableScreenshot', () async {
    MockUltronScreenshotShieldPlatform fakePlatform =
        MockUltronScreenshotShieldPlatform();
    UltronScreenshotShieldPlatform.instance = fakePlatform;

    expect(await UltronScreenshotShield.disableScreenshot(), true);
  });
}
