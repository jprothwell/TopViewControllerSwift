import UIKit

func _keyWindow() -> UIWindow?{
    return UIApplication.shared.keyWindow ?? UIApplication.shared.delegate?.window ?? nil
}

func _TopVisibleViewController(vc:UIViewController?) -> UIViewController? {
    if let tabBarController = vc as? UITabBarController {
        return _TopVisibleViewController(vc: tabBarController.selectedViewController)
    }
    else if let navigationController = vc as? UINavigationController {
        return _TopVisibleViewController(vc: navigationController.visibleViewController)
    }
    else if let pv = vc?.presentedViewController {
        return _TopVisibleViewController(vc: pv)
    }
    else if vc?.children.isEmpty == false {
        return _TopVisibleViewController(vc: vc?.children.last)
    }
    return vc
}

public func TopViewController()->UIViewController?{
    return _TopVisibleViewController(vc: RootViewController())
}

public func RootViewController()->UIViewController?{
    return _keyWindow()?.rootViewController
}
