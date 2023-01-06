//
//  ShowCollectionView.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RecipesViewController: BaseUIViewController {
	let recipesView = RecipesView()
	
	override func loadView() {
		super.loadView()
		
		view = recipesView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		recipesView.setShowRecipe { recipe in
			let recipeViewController = RecipeViewController()
			
			recipeViewController.recipe = recipe
			
			self.present(recipeViewController, animated: true)
		}
	}
}
