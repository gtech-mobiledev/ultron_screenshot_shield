# ultron_screenshot_shield

Flutter plugin to enable or disable screenshot support in your application.

## Getting Started

If you want to prevent user from taking screenshot of your app. 

You can disable the screenshot support by simply calling
```dart
await UltronScreenshotShield.disableScreenshot();
```

You can enable again the screenshot support by simply calling
```dart
await UltronScreenshotShield.enableScreenshot();
```

for the relevant screen.

This can further be toggled for a specific screen by either using a RouteAware mixin, or through direct toggling in initState() and dispose() methods in the case of stateful widgets.