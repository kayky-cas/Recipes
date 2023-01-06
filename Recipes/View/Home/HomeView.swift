//
//  HomeView.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class HomeView: BaseUIView {
	
	lazy var registerImageTapView: ImageTapView = {
		let imageTapView = ImageTapView()
		
		let uiImage = UIImage(named: "cooking")
		imageTapView.setBackgroundImage(image: uiImage)
		imageTapView.setTitle(text: "REGISTER")
		
		return imageTapView
	}()
	
	lazy var showImageTapView: ImageTapView = {
		let imageTapView = ImageTapView()
		
		let uiImage = UIImage(named: "recipe-book")
		imageTapView.setBackgroundImage(image: uiImage)
		imageTapView.setTitle(text: "RECIPE BOOK")
		
		return imageTapView
	}()
	
	var views: [BaseUIView] = []
	
	override func setup() {
		
		[registerImageTapView, showImageTapView].forEach({
			self.addSubview($0)
			$0.setup()
			views.append($0)
		})
	}
	
	override func setupConstraints() {
		let views = [registerImageTapView, showImageTapView]
		
		let verticalPadding = 180.0
		let size = CGSize(width: 350, height: 230)
		
		registerImageTapView.anchor(
			top: topAnchor,
			padding: .init(top: verticalPadding, left: 0, bottom: 0, right: 0),
			size: size
		)
		
		showImageTapView.anchor(
			bottom: bottomAnchor,
			padding: .init(top: 0, left: 0, bottom: verticalPadding, right: 0),
			
			size: size
		)
		
		views.forEach({
			$0.setupConstraints()
			$0.anchorCenterX(to: centerXAnchor)
		})
	}
	
	func setNavigationToTapImages(register: @escaping () -> Void, show: @escaping () -> Void) {
		registerImageTapView.setTouchUpInside(completion: register)
		showImageTapView.setTouchUpInside(completion: show)
	}
}
