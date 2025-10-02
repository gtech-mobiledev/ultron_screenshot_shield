import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ultron_screenshot_shield/ultron_screenshot_shield_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelUltronScreenshotShield platform =
      MethodChannelUltronScreenshotShield();
  const MethodChannel channel = MethodChannel('ultron_screenshot_shield');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return true;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('enableScreenshot', () async {
    expect(await platform.enableScreenshot(), true);
  });
}
