//
//  FirstViewController.swift
//  ButtonAnimation
//
//  Created by Yernar Masujima on 04.05.2023.
//

import UIKit

final class FirstViewController: UIViewController {
	
	private lazy var firstButton: AnimatableButton = {
		let button = AnimatableButton()
		button.setTitle("First Button", for: .normal)
		button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
		
		return button
	}()
	
	private lazy var secondMediumButton: AnimatableButton = {
		let button = AnimatableButton()
		button.setTitle("Second Medium Button", for: .normal)
		button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
		
		return button
	}()
	
	private lazy var thirdButton: AnimatableButton = {
		let button = AnimatableButton()
		button.addTarget(self, action: #selector(thirdButtonTapped), for: .touchUpInside)
		button.setTitle("Third", for: .normal)
		button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
		
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		setupFirstButton()
		setupSecondMediumButton()
		setupThirdButton()
	}
	
	private func setupFirstButton() {
		view.addSubview(firstButton)
		NSLayoutConstraint.activate([
			firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			firstButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			firstButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
	}
	
	private func setupSecondMediumButton() {
		view.addSubview(secondMediumButton)
		NSLayoutConstraint.activate([
			secondMediumButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
			secondMediumButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			secondMediumButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			secondMediumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	private func setupThirdButton() {
		view.addSubview(thirdButton)
		NSLayoutConstraint.activate([
			thirdButton.topAnchor.constraint(equalTo: secondMediumButton.bottomAnchor, constant: 10),
			thirdButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			thirdButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	@objc
	func thirdButtonTapped() {
		present(SecondViewController(), animated: true)
	}
}
