//
//  RegisterViewController.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RegisterViewController: BaseUIViewController {
	let recipeViewModel = RecipeViewModel()
	let registerView = RegisterView()
	
	override func loadView() {
		super.loadView()
		view = registerView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		registerView.setCreateRecipe(completion: createRecipe)
	}
	
	func createRecipe(_ recipe: Recipe) {
		recipeViewModel.addRecipe(recipe: recipe)
		navigationController?.popToRootViewController(animated: true)
	}
}
