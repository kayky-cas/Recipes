//
//  AppDelegate.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let rootViewController = HomeViewController()
		
		let navigationViewController = UINavigationController(rootViewController: rootViewController)
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.tintColor = .systemOrange
		
		window?.rootViewController = navigationViewController
		window?.makeKeyAndVisible()
		
		// Override point for customization after application launch.
		return true
	}
}

