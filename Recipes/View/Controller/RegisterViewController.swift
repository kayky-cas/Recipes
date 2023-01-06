//
//  RegisterViewController.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class RegisterViewController: BaseViewController {
	let registerView = RegisterView()
	
	override func loadView() {
		super.loadView()
		view = registerView
	}
}
