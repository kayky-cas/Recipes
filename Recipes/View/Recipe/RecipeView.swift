//
//  RecipeView.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RecipeView: BaseUIView {
	private var recipe: Recipe? {
		didSet {
			if let recipe = recipe {
				titleLabel.text = recipe.title
				descriptionLabel.text = recipe.description
				
				var text = ""
				
				for (i, val) in recipe.howToMake.enumerated() {
					text += "\(i + 1) - \(val)\n\n"
				}
				
				howToMakeLabel.text = text
			}
		}
	}
	
	lazy var topImage: UIImageView = {
		let uiImageView = UIImageView()
	
		uiImageView.contentMode = .scaleAspectFit
		uiImageView.image = UIImage(named: "recipe")
		
		return uiImageView
	}()
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.font = .italicSystemFont(ofSize: 25)
		uiLabel.textColor = .tintColor
//		uiLabel.textAlignment = .center
		
		return uiLabel
	}()
	
	lazy var descriptionNameLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.font = .systemFont(ofSize: 17)
//		uiLabel.textColor =
		uiLabel.text = "Descricão:"
		
		return uiLabel
	}()
	
	lazy var howToMakeNameLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.font = .systemFont(ofSize: 17)
//		uiLabel.textColor =
		uiLabel.text = "Modo de preparo:"
		
		return uiLabel
	}()
	
	lazy var descriptionLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.font = .systemFont(ofSize: 15)
		uiLabel.numberOfLines = 0
		uiLabel.textAlignment = .justified
		
		return uiLabel
	}()
	
	lazy var howToMakeLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.font = .systemFont(ofSize: 15)
		uiLabel.numberOfLines = 0
		uiLabel.textAlignment = .justified
		
		return uiLabel
	}()
	
	override func setup() {
		addSubviews(topImage, titleLabel, descriptionNameLabel, descriptionLabel, howToMakeNameLabel, howToMakeLabel)
	}
	
	override func setupConstraints() {
		
		topImage.anchor(
			top: safeAreaLayoutGuide.topAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			size: .init(width: frame.width, height: 263)
		)
		
		titleLabel.anchor(
			top: topImage.bottomAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 5, left: 10, bottom: 0, right: 0)
		)
		
		descriptionNameLabel.anchor(
			top: titleLabel.bottomAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 20, left: 20, bottom: 0, right: 0)
		)
		
		descriptionLabel.anchor(
			top: descriptionNameLabel.bottomAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 10, left: 25, bottom: 0, right: 25)
		)
		
		howToMakeNameLabel.anchor(
			top: descriptionLabel.bottomAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 20, left: 20, bottom: 0, right: 0)
		)
		
		howToMakeLabel.anchor(
			top: howToMakeNameLabel.bottomAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 10, left: 25, bottom: 0, right: 25)
		)
	}
	
	func setRecipe(_ recipe: Recipe) {
		self.recipe = recipe
	}
}
