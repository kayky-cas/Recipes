//
//  BaseViewController.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class BaseViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemGray6
		
		(view as! BaseView).setup()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		(view as! BaseView).setupConstraints()
	}
}
