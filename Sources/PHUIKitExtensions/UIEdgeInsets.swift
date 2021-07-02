//
//  File.swift
//  
//
//  Created by Benni on 20.09.20.
//

import Foundation
import UIKit

public extension UIEdgeInsets {
	/// Convenience initializer that provides default values of `0.0` for values not set.
	/// - Parameters:
	///   - top: The top edge inset. Default value is `0.0`.
	///   - leading: The leading edge inset. Default value is `0.0`.
	///   - bottom: The bottom edge inset. Default value is `0.0`.
	///   - trailing: The trailing edge inset. Default value is `0.0`.
	init(top: CGFloat = 0.0, leading: CGFloat = 0.0, bottom: CGFloat = 0.0, trailing: CGFloat = 0.0) {
		self.init(top: top, left: leading, bottom: bottom, right: trailing)
	}
	
	/// Convenience initializer that provides default values of `0.0` for values not set.
	/// - Parameters:
	///   - vertical: The vertical inset, setting `.top` and `.bottom` to this value.
	///   - horizontal: The horizontal inset, setting `.leading` and `.trailing` to this value.
	init(vertical: CGFloat = 0.0, horizontal: CGFloat = 0.0) {
		self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
	}
	
	
	/// Convenience accessor to create a `UIEdgeInsets` value with vertical insets.
	/// - Parameter value: The vertical inset, setting `.top` and `.bottom` to this value.
	/// - Returns: A `UIEdgeInsets` value, with `.top` and `.bottom` set to the given parameter, and `.leading` and `.trailing` set to `0`.
	static func vertical(_ value: CGFloat) -> UIEdgeInsets {
		UIEdgeInsets(vertical: value)
	}
	
	/// Convenience accessor to create a `UIEdgeInsets` value with horizontal insets.
	/// - Parameter value: The horizontal inset, setting `.leading` and `.trailing` to this value.
	/// - Returns: A `UIEdgeInsets` value, with `.leading` and `.trailing` set to the given parameter, and `.top` and `.bottom` set to `0`.
	static func horizontal(_ value: CGFloat) -> UIEdgeInsets {
		UIEdgeInsets(horizontal: value)
	}
}
