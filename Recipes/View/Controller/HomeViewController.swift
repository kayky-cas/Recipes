//
//  ViewController.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class HomeViewController: BaseUIViewController {

	let homeView = HomeView()
	
	override func loadView() {
		super.loadView()
		view = homeView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		homeView.setNavigationToTapImages(register: navigateToRegister, show: navigateToRecipes)
	}
	
	func navigateToRegister() {
		let registerViewController = RegisterViewController()
		navigationController?.pushViewController(registerViewController, animated: true)
	}
	
	// TODO
	func navigateToRecipes() {
		let recipesViewController = RecipesViewController()
		navigationController?.pushViewController(recipesViewController, animated: true)
	}
}

