//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RecipeViewModel {
	private let repository = RecipeRepositoryMock.shared
	
	func getRecipes() -> [Recipe] {
		var recipes: [Recipe] = []
		
		repository.getRecipes { recipes = $0 }
		
		return recipes
	}
	
	func addRecipe(recipe: Recipe) {
		repository.addRecipes(recipe: recipe)
	}
}
