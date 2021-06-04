//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 06.03.21.
//

import Foundation
import UIKit


@available(iOS 14.0, *)
public extension UIButton {
	
	/// Convenience initializer to create a `UIButton` with an actio closure.
	/// - Parameters:
	///   - title: The optional title for the button. Default value is `nil`.
	///   - action: The action that is called when the button is tapped.
	convenience init(title: String? = nil, action: @escaping () -> Void) {
		self.init(type: .custom, primaryAction: UIAction { _ in
			action()
		})
		
		if let title = title {
			setTitle(title, for: .normal)
		}
	}
	
	/// Adds an action closure as the `.touchUpInside` action to this button.
	/// - Parameter action: The action that is called when the button is pressed.
	func addAction(_ action: @escaping () -> Void) {
		self.addAction(UIAction { _ in
			action()
		}, for: .touchUpInside)
	}
	
	
}
