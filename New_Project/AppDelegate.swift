//
//  AppDelegate.swift
//  New_Project
//
//  Created by Sherzod on 24/11/22.
//





import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = AppealVC()
        IQKeyboardManager.shared.enable = true
        let navVc = UINavigationController.init(rootViewController: vc)
        window?.rootViewController = navVc
        window?.makeKeyAndVisible()
        return true
    }
}

