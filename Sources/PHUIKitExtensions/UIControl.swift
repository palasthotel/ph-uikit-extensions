//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 05.07.24.
//

import Foundation
import UIKit


extension UIControl {
	
	/// Adds an action closure as the `.touchUpInside` action to this button.
	/// - Parameter action: The action that is called when the button is pressed.
	@objc open func addAction(_ action: @escaping () -> Void) {
		self.addAction(UIAction { _ in
			action()
		}, for: .touchUpInside)
	}
	
}
