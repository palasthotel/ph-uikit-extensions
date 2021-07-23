//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 19.01.21.
//

import Foundation
import UIKit


@available(iOS 14.0, *)
public extension UIBarButtonItem {
	
	/// Convenience initializer to easily create a system `UIBarButtonItem` with an action closure.
	/// - Parameters:
	///   - systemItem: The system item style for the new bar button item.
	///   - action: The action that is called when the bar button item is tapped.
	convenience init(systemItem: UIBarButtonItem.SystemItem, action: @escaping () -> Void) {
		self.init(systemItem: systemItem, primaryAction: UIAction { _ in
			action()
		})
	}
	
	/// Convenience initializer to easily create a `UIBarButtonItem` with a custom title or image and an action closure.
	/// - Parameters:
	///   - title: The title for the bar button item. Must be set, but can be an empty string.
	///   - image: The optional image for the bar button item. If this is set, the title is ignored. Default value is `nil`.
	///   - menu: An optional menu for the bar button item. Gets shown on a long press. Default value is `nil`.
	///   - action: The primary action of the bar button item.
	convenience init(title: String? = nil, image: UIImage? = nil, menu: UIMenu? = nil, action: @escaping () -> Void) {
		self.init(title: title, image: image, primaryAction: UIAction { _ in action() }, menu: menu)
	}
}
