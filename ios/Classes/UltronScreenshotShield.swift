import UIKit

public class UltronScreenshotShield {
    
    private var window: UIWindow? = nil
    private var screenPrevent = UITextField()
    private var screenshotObserve: NSObjectProtocol? = nil

    public init(window: UIWindow?) {
        self.window = window
    }

    public func screenshotObserver(using onScreenshot: @escaping () -> Void) {
        screenshotObserve = NotificationCenter.default.addObserver(
            forName: UIApplication.userDidTakeScreenshotNotification,
            object: nil,
            queue: OperationQueue.main
        ) { notification in
            onScreenshot()
        }
    }

    public func removeScreenshotObserver() {
        if screenshotObserve != nil {
            self.removeObserver(observer: screenshotObserve)
            self.screenshotObserve = nil
        }
    }

    public func removeObserver(observer: NSObjectProtocol?) {
        guard let obs = observer else {return}
        NotificationCenter.default.removeObserver(obs)
    }

    public func configurePreventionScreenshot() {
        guard let w = window else { return }
        
        if (!w.subviews.contains(screenPrevent)) {
            w.addSubview(screenPrevent)
            screenPrevent.centerYAnchor.constraint(equalTo: w.centerYAnchor).isActive = true
            screenPrevent.centerXAnchor.constraint(equalTo: w.centerXAnchor).isActive = true
            w.layer.superlayer?.addSublayer(screenPrevent.layer)
            if #available(iOS 17.0, *) {
                screenPrevent.layer.sublayers?.last?.addSublayer(w.layer)
            } else {
                screenPrevent.layer.sublayers?.first?.addSublayer(w.layer)
            }
        }
    }

    public func enabledPreventScreenshot() {
        screenPrevent.isSecureTextEntry = true
    }

    public func disablePreventScreenshot() {
        screenPrevent.isSecureTextEntry = false
    }
}
