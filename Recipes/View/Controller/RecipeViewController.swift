//
//  RecipeViewController.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RecipeViewController: BaseUIViewController {
	let recipeView = RecipeView()
	
	var recipe: Recipe? {
		didSet {
			if let recipe = recipe {
				recipeView.setRecipe(recipe)
			}
		}
	}
	
	override func loadView() {
		super.loadView()
		
		view = recipeView
	}
}
