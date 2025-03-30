//
//  AppDelegate.swift
//  Vocabulary
//
//  Created by Mena Gamal on 27/03/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
       var coordinator: AppCoordinator?

       func application(_ application: UIApplication,
                        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           let window = UIWindow(frame: UIScreen.main.bounds)
           coordinator = AppCoordinator(window: window)
           coordinator?.start()
           self.window = window
           return true
       }


}

