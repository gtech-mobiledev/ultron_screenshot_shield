import Flutter
import UIKit
import ScreenProtectorKit

public class UltronScreenshotShieldPlugin: NSObject, FlutterPlugin {

  private var screenProtectorKit: ScreenProtectorKit? = nil
    
  init(screenProtectorKit: ScreenProtectorKit) {
    self.screenProtectorKit = screenProtectorKit
  }
  
  deinit {
    screenProtectorKit?.removeAllObserver()
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ultron_screenshot_shield", binaryMessenger: registrar.messenger())

    let window = UIApplication.shared.delegate?.window
    let screenProtectorKit = ScreenProtectorKit(window: window as? UIWindow)
    screenProtectorKit.configurePreventionScreenshot()

    let instance = UltronScreenshotShieldPlugin(screenProtectorKit: screenProtectorKit)
    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.addApplicationDelegate(instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "disableScreenshot":
      screenProtectorKit?.enabledPreventScreenshot()
      result(true)
    case "enableScreenshot":
      screenProtectorKit?.disablePreventScreenshot()
      result(true)
    default:
      result(false)
    }
  }
}
