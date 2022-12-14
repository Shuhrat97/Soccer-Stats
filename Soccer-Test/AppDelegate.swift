//
//  AppDelegate.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        showMainView()
        return true
    }
    
    func showMainView(){
        window = UIWindow()
        window?.backgroundColor = .white
        let ctrl = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = ctrl
        window?.makeKeyAndVisible()
    }

}

