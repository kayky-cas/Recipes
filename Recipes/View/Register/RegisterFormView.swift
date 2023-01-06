//
//  RegisterFormView.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RegisterFormView: BaseUIView, UITextViewDelegate {
	private var isValid: (Bool) -> Void = { _ in }
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Title:"
		uiLabel.textColor = .gray
		
		return uiLabel
	}()
	
	lazy var titleTextField: UITextField = {
		let uiTextField = UITextField()
		
		uiTextField.borderStyle = .roundedRect
		uiTextField.autocorrectionType = .yes
		
		
		return uiTextField
	}()
	
	lazy var descriptionLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Description:"
		uiLabel.textColor = .gray
		
		return uiLabel
	}()
	
	lazy var descriptionTextView: UITextView = {
		let uiTextView = UITextView()
		
		uiTextView.layer.cornerRadius = 5
		uiTextView.layer.borderWidth = 1
		uiTextView.layer.borderColor = UIColor.systemGray5.cgColor
		uiTextView.layer.masksToBounds = true
		uiTextView.delegate = self
		
		return uiTextView
	}()
	
	lazy var howToDoLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "How to make:"
		uiLabel.textColor = .gray
		
		return uiLabel
	}()
	
	lazy var howToDoTextView: UITextView = {
		let uiTextView = UITextView()
		
		uiTextView.layer.cornerRadius = 5
		uiTextView.layer.borderWidth = 1
		uiTextView.layer.borderColor = UIColor.systemGray5.cgColor
		uiTextView.layer.masksToBounds = true
		uiTextView.delegate = self
		
		return uiTextView
	}()
	
	override func setup() {
		addSubviews(titleLabel, titleTextField, descriptionLabel, descriptionTextView, howToDoLabel, howToDoTextView)
	}
	
	override func setupConstraints() {
		titleLabel.anchor(
			top: safeAreaLayoutGuide.topAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor
		)
		
		titleTextField.anchor(
			top: titleLabel.bottomAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 5, left: 0, bottom: 0, right: 0)
		)
		
		descriptionLabel.anchor(
			top: titleTextField.bottomAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 10, left: 0, bottom: 0, right: 0)
		)
		
		descriptionTextView.anchor(
			top: descriptionLabel.bottomAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 5, left: 0, bottom: 0, right: 0),
			size: .init(width: 0, height: 80)
		)
		
		howToDoLabel.anchor(
			top: descriptionTextView.bottomAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 10, left: 0, bottom: 0, right: 0)
		)
		
		howToDoTextView.anchor(
			top: howToDoLabel.bottomAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			bottom: safeAreaLayoutGuide.bottomAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 5, left: 0, bottom: 0, right: 0)
		)
	}
	
	@objc private func validate() {
		let validTitle = titleTextField.text ?? "" != ""
		let validDesc = descriptionTextView.text ?? "" != ""
		let validHowToDo = howToDoTextView.text ?? "" != ""
		
		isValid(validTitle && validDesc && validHowToDo)
	}
	
	func setIsValid(completion: @escaping (Bool) -> Void) {
		isValid = completion
	}
	
	func textViewDidChange(_ textView: UITextView){
		validate()
	}
	
	func getRecipe() -> Recipe {
		let title = titleTextField.text ?? ""
		let description = descriptionTextView.text ?? ""
		let howToMake = (howToDoTextView.text ?? "").split(separator: "\n").map({ String($0) })
		
		return .init(title: title, description: description, howToMake: howToMake)
	}
}
