//
//  UIAlertController.swift
//  Grow
//
//  Created by Benjamin Böcker on 07.01.21.
//

import Foundation
import UIKit


public extension UIAlertController {

	
	/// Creates an `UIAlertController` instance with the given title, message and button. Only shows one button and is always displayed in the `.alert` style.
	/// - Parameters:
	///   - title: The optional title of the alert controller. Default value is nil.
	///   - message: The optional message of the alert controller. Default value is nil.
	///   - buttonTitle: The optional title of the button. Default value is nil.
	///   - buttonStyle: The optional button style of the button. Default value is `.default`.
	///   - action: The action that is called when the button is pressed.
	/// - Returns: An instance of `UIAlertController` with the specified titles and message.
	static func oneButtonAlert(_ title: String? = nil,
							   message: String? = nil,
							   buttonTitle: String? = nil,
							   buttonStyle: UIAlertAction.Style = .default,
							   action: @escaping () -> Void = { }
	) -> UIAlertController {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertController.add(buttonTitle, style: buttonStyle, action)
		return alertController
	}
	
	/// Creates an `UIAlertController` instance with the given title, message and two buttons. It is always presented in the `.alert` style.
	/// - Parameters:
	///   - title: The optional title of the alert controller. Default value is nil.
	///   - message: The optional message of the alert controller. Default value is nil.
	///   - firstButtonTitle: The optional title of the left button. Default value is nil.
	///   - firstButtonStyle: The optional style of the left button. Default value is `.default`.
	///   - firstAction: The action that is called when the left button is pressed.
	///   - secondButtonTitle: The optional title of the right button. Default value is nil.
	///   - secondButtonStyle: The optional style of the right button. Default value is `.default`.
	///   - secondAction: The action that is called when the right button is pressed.
	/// - Returns: An instance of `UIAlertController` with the specified title, message and buttons.
	static func twoButtonAlert(_ title: String? = nil,
							   message: String? = nil,
							   firstButtonTitle: String? = nil,
							   firstButtonStyle: UIAlertAction.Style = .default,
							   firstAction: @escaping () -> Void = { },
							   secondButtonTitle: String? = nil,
							   secondButtonStyle: UIAlertAction.Style = .default,
							   secondAction: @escaping () -> Void = { }
	) -> UIAlertController {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertController.add(firstButtonTitle, style: firstButtonStyle, firstAction)
		alertController.add(secondButtonTitle, style: secondButtonStyle, secondAction)
		return alertController
	}
		
	
	/// Adds a button to the alert controller.
	/// - Parameters:
	///   - title: The optional title of the button. Default value is nil.
	///   - style: The optional style of the button. Default value is `.default`.
	///   - action: The action that is called when the button is pressed.
	func add(_ title: String? = nil, style: UIAlertAction.Style = .default, _ action: @escaping () -> Void) {
		addAction(UIAlertAction(title: title,
								style: style) { _ in
			action()
		})
	}
}
