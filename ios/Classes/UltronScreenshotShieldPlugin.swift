import Flutter
import UIKit

public class UltronScreenshotShieldPlugin: NSObject, FlutterPlugin {

  private var screenshotShield: UltronScreenshotShield? = nil
    
  init(screenshotShield: UltronScreenshotShield) {
    self.screenshotShield = screenshotShield
  }
  
  deinit {
    screenshotShield?.removeScreenshotObserver()
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ultron_screenshot_shield", binaryMessenger: registrar.messenger())

    let window = UIApplication.shared.delegate?.window
    let screenshotShield = UltronScreenshotShield(window: window as? UIWindow)
    screenshotShield.configurePreventionScreenshot()

    let instance = UltronScreenshotShieldPlugin(screenshotShield: screenshotShield)
    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.addApplicationDelegate(instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "disableScreenshot":
      screenshotShield?.enabledPreventScreenshot()
      result(true)
    case "enableScreenshot":
      screenshotShield?.disablePreventScreenshot()
      result(true)
    default:
      result(false)
    }
  }
}
