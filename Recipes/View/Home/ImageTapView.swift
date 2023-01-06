//
//  ImageTapView.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import UIKit

class ImageTapView: BaseView {
	private var touchUpInside: () -> Void = {}
	
	lazy var backgroundImage: UIImageView = {
		let uiImageView = UIImageView()
	
		uiImageView.contentMode = .scaleToFill
		
		return uiImageView
	}()
	
	lazy var opaqueImageLayer: UIView = {
		let uiView = UIView()
		
		uiView.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
		
		return uiView
	}()
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.textAlignment = .center
		uiLabel.font = .boldSystemFont(ofSize: 40)
		uiLabel.textColor = .white
		
		return uiLabel
	}()
	
	lazy var tapImageLayer: UIView = {
		let uiView = UIView()
		
		uiView.backgroundColor = .clear
		
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapLayerTouchUpInside))

		uiView.addGestureRecognizer(tapGestureRecognizer)
		uiView.isUserInteractionEnabled = true
		
		return uiView
	}()
	
	override func setup() {
		addSubviews(backgroundImage, opaqueImageLayer, titleLabel, tapImageLayer)
		
		layer.cornerRadius = 20
		layer.masksToBounds = true
		layer.borderColor = UIColor.tintColor.cgColor
		layer.borderWidth = 4
	}
	
	override func setupConstraints() {
		backgroundImage.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			bottom: bottomAnchor,
			trailing: trailingAnchor
		)
		
		opaqueImageLayer.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			bottom: bottomAnchor,
			trailing: trailingAnchor
		)
		
		titleLabel.anchor(
			leading: leadingAnchor,
			trailing: trailingAnchor
		)
		
		titleLabel.anchorCenterY(to: centerYAnchor)
		
		tapImageLayer.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			bottom: bottomAnchor,
			trailing: trailingAnchor
		)
	}
	
	@objc private func tapLayerTouchUpInside() {
		touchUpInside()
	}
	
	func setTitle(text: String) {
		titleLabel.text = text
	}
	
	func setBackgroundImage(image: UIImage?) {
		backgroundImage.image = image
	}
	
	func setTouchUpInside(completion: @escaping () -> Void) {
		touchUpInside = completion
	}
}
