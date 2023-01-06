//
//  RecipeCollectionViewCell.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
	static let identifier = "RecipeCollectionViewCell"
	
	private var recipe: Recipe? {
		didSet {
			if let recipe = recipe {
				titleLabel.text = recipe.title + ": "
				descriptionLabel.text = recipe.description
			}
		}
	}
	
	lazy var imageView: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.textColor = .tintColor
		uiLabel.font = .boldSystemFont(ofSize: 15)
		
		return uiLabel
	}()
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.textColor = .tintColor
		uiLabel.font = .boldSystemFont(ofSize: 15)
		
		return uiLabel
	}()
	
	lazy var descriptionLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.textColor = .gray
		uiLabel.font = .italicSystemFont(ofSize: 15)
		
		return uiLabel
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setupCell()
		setupConstraints()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	func setup() {
		contentView.addSubviews(titleLabel, descriptionLabel)
	}
	
	func setupCell() {
		contentView.backgroundColor = .secondarySystemGroupedBackground
		contentView.layer.cornerRadius = 10
		contentView.layer.masksToBounds = true
		contentView.layer.borderWidth = 1.5
		contentView.layer.borderColor = UIColor.tintColor.cgColor
	}
	
	func setupConstraints() {
		titleLabel.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			bottom: bottomAnchor,
			padding: .init(top: 0, left: 10, bottom: 0, right: 0)
		)
		
		descriptionLabel.anchor(
			top: topAnchor,
			leading: titleLabel.trailingAnchor,
			bottom: bottomAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 0, left: 0, bottom: 0, right: 10)
		)
	}
	
	func setRecipe(_ recipe: Recipe) {
		self.recipe = recipe
	}
}
