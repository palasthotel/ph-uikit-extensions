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
	
	
	/// Convenience initializer that sets all values to the given parameter.
	/// - Parameters:
	///   - insetBy: The inset value, setting `.top`, `.bottom`, `.leading` and `.trailing` to this value.
	init(insetBy value: CGFloat) {
		self.init(top: value, leading: value, bottom: value, trailing: value)
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
	
	/// Convenience accessor to create a `UIEdgeInsets` value with only a top inset.
	/// - Parameter value: The top inset, setting only `.top` to this value.
	/// - Returns: A `UIEdgeInsets` value, with `.top` set to the given parameter, and everything else set to `0`.
	static func top(_ value: CGFloat) -> UIEdgeInsets {
		UIEdgeInsets(top: value)
	}
	
	/// Convenience accessor to create a `UIEdgeInsets` value with only a bottom inset.
	/// - Parameter value: The bottom inset, setting only `.bottom` to this value.
	/// - Returns: A `UIEdgeInsets` value, with `.bottom` set to the given parameter, and everything else set to `0`.
	static func bottom(_ value: CGFloat) -> UIEdgeInsets {
		UIEdgeInsets(bottom: value)
	}
	
	/// Convenience accessor to create a `UIEdgeInsets` value with only a leading inset.
	/// - Parameter value: The leading inset, setting only `.leading` to this value.
	/// - Returns: A `UIEdgeInsets` value, with `.leading` set to the given parameter, and everything else set to `0`.
	static func leading(_ value: CGFloat) -> UIEdgeInsets {
		UIEdgeInsets(leading: value)
	}
	
	/// Convenience accessor to create a `UIEdgeInsets` value with only a trailing inset.
	/// - Parameter value: The trailing inset, setting only `.trailing` to this value.
	/// - Returns: A `UIEdgeInsets` value, with `.trailing` set to the given parameter, and everything else set to `0`.
	static func trailing(_ value: CGFloat) -> UIEdgeInsets {
		UIEdgeInsets(trailing: value)
	}
	
	/// Convenience accessor to create a `UIEdgeInsets` value with all values set to a given inset.
	/// - Parameter value: The inset, setting all values to this value.
	/// - Returns: A `UIEdgeInsets` value, with all values set to the given parameter.
	static func by(_ inset: CGFloat) -> UIEdgeInsets {
		.init(insetBy: inset)
	}
}
