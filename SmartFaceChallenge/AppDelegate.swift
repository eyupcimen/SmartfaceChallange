//
//  AppDelegate.swift
//  SmartFaceChallenge
//
//  Created by eyupcimen on 21.07.2018.
//  Copyright © 2018 eyupcimen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let rootVC : GalleryVC = GalleryVC()
        let rootNC = UINavigationController(rootViewController: rootVC)
        rootNC.navigationBar.barStyle = .default
        self.window?.rootViewController = rootNC
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
            }

    func applicationWillTerminate(_ application: UIApplication) {

    }


}

