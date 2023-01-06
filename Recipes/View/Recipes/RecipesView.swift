//
//  ShowView.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RecipesView: BaseUIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	let recipeViewModel = RecipeViewModel()
	
	private var showRecipe: (Recipe) -> Void = { _ in }
	
	private let collectionView = UICollectionView(
		frame: .zero,
		collectionViewLayout: UICollectionViewFlowLayout()
	)
	
	override func setup() {
		addSubview(collectionView)
		
		backgroundColor = .systemGroupedBackground
		
		collectionView.register(
			RecipeCollectionViewCell.self,
			forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier
		)
		
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
	override func setupConstraints() {
		collectionView.frame = bounds
	}
	
	func setShowRecipe(completion: @escaping (Recipe) -> Void) {
		showRecipe = completion
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return recipeViewModel.getRecipes().count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: RecipeCollectionViewCell.identifier,
			for: indexPath
		) as! RecipeCollectionViewCell
		
		let recipe = recipeViewModel.getRecipes()[indexPath.item]
		cell.setRecipe(recipe)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = frame.width - 50
		return CGSize(width: width, height: 50)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		let recipe = recipeViewModel.getRecipes()[indexPath.item]
		showRecipe(recipe)
	}
}
