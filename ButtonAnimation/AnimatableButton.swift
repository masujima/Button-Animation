//
//  AnimatableButton.swift
//  ButtonAnimation
//
//  Created by Yernar Masujima on 05.05.2023.
//

import UIKit

class AnimatableButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupAnimatableButton()
		setDefaultConfiguration()
	}
	
	override func tintColorDidChange() {
		super.tintColorDidChange()
		
		switch tintAdjustmentMode {
		case .dimmed:
			backgroundColor = .systemGray
		default:
			backgroundColor = .systemBlue
		}
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		setupAnimatableButton()
		setDefaultConfiguration()
	}
	
	private func setDefaultConfiguration() {
		var config = UIButton.Configuration.filled()
		config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
		config.cornerStyle = .dynamic
		config.imagePlacement = .trailing
		config.imagePadding = 8
		configuration = config
	}
	
	private func setupAnimatableButton() {
		addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
		layer.cornerRadius = 5
		translatesAutoresizingMaskIntoConstraints = false
	}
		
	@objc
	func buttonTap() {
		UIView.animate(withDuration: 0.2, delay: 0.0, options: [.allowUserInteraction], animations: {
			self.transform = .init(scaleX: 0.5, y: 0.5)
		}) { _ in
			UIView.animate(withDuration: 0.2) {
				self.transform = .identity
			}
		}
	}
}
