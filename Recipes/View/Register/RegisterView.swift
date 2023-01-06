//
//  RegisterView.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RegisterView: BaseUIView {
	var createRecipe: (Recipe) -> Void = { _ in }
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Create a Recipe"
		uiLabel.textColor = .tintColor
		uiLabel.font = .boldSystemFont(ofSize: 35)
		uiLabel.textAlignment = .center
		
		return uiLabel
	}()
	
	lazy var registerFormView = RegisterFormView()
	
	lazy var registerButton: UIButton = {
		let uiButton = UIButton(configuration: .filled())
		
		uiButton.setTitle("Register", for: .normal)
		uiButton.isEnabled = false
		uiButton.addTarget(self, action: #selector(registerButtonTouchUpInside), for: .touchUpInside)
		
		return uiButton
	}()
	
	override func setup() {
		addSubviews(titleLabel, registerFormView, registerButton)
		
		registerFormView.setup()
		registerFormView.setIsValid(completion: { self.registerButton.isEnabled = $0 })
	}
	
	override func setupConstraints() {
		let distance = 40.0
		
		titleLabel.anchor(
			top: safeAreaLayoutGuide.topAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor
		)
		
		registerButton.anchor(
			bottom: bottomAnchor,
			padding: .init(top: 0, left: 0, bottom: distance, right: 0),
			size: .init(width: 140, height: 0)
		)
		
		registerButton.anchorCenterX(to: centerXAnchor)
		
		registerFormView.anchor(
			top: titleLabel.bottomAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			bottom: registerButton.topAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 30, left: 30, bottom: distance, right: 30)
		)
		
		registerFormView.setupConstraints()
	}
	
	@objc private func registerButtonTouchUpInside() {
		createRecipe(registerFormView.getRecipe())
	}
	
	func setCreateRecipe(completion: @escaping (Recipe) -> Void) {
		createRecipe = completion
	}
}
