//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 30.09.21.
//

import Foundation
import UIKit

public extension NSDirectionalEdgeInsets {
	/// Convenience accessor that provides default values of `0.0` for values not set.
	/// - Parameters:
	///   - top: The top edge inset. Default value is `0.0`.
	///   - leading: The leading edge inset. Default value is `0.0`.
	///   - bottom: The bottom edge inset. Default value is `0.0`.
	///   - trailing: The trailing edge inset. Default value is `0.0`.
	static func with(top: CGFloat = 0.0, leading: CGFloat = 0.0, bottom: CGFloat = 0.0, trailing: CGFloat = 0.0) -> NSDirectionalEdgeInsets {
		NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
	}

	/// Convenience initializer that sets all values to the given parameter.
	/// - Parameters:
	///   - insetBy: The inset value, setting `.top`, `.bottom`, `.leading` and `.trailing` to this value.
	init(insetBy value: CGFloat) {
		self.init(top: value, leading: value, bottom: value, trailing: value)
	}
	
	/// Convenience initializer that provides default values of `0.0` for values not set.
	/// - Parameters:
	///   - vertical: The vertical inset, setting `.top` and `.bottom` to this value.
	///   - horizontal: The horizontal inset, setting `.leading` and `.trailing` to this value.
	init(vertical: CGFloat = 0.0, horizontal: CGFloat = 0.0) {
		self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
	}
	
	
	/// Convenience accessor to create a `NSDirectionalEdgeInsets` value with vertical insets.
	/// - Parameter value: The vertical inset, setting `.top` and `.bottom` to this value.
	/// - Returns: A `NSDirectionalEdgeInsets` value, with `.top` and `.bottom` set to the given parameter, and `.leading` and `.trailing` set to `0`.
	static func vertical(_ value: CGFloat) -> NSDirectionalEdgeInsets {
		NSDirectionalEdgeInsets(vertical: value)
	}
	
	/// Convenience accessor to create a `NSDirectionalEdgeInsets` value with horizontal insets.
	/// - Parameter value: The horizontal inset, setting `.leading` and `.trailing` to this value.
	/// - Returns: A `NSDirectionalEdgeInsets` value, with `.leading` and `.trailing` set to the given parameter, and `.top` and `.bottom` set to `0`.
	static func horizontal(_ value: CGFloat) -> NSDirectionalEdgeInsets {
		NSDirectionalEdgeInsets(horizontal: value)
	}
	
	/// Convenience accessor to create a `NSDirectionalEdgeInsets` value with only a top inset.
	/// - Parameter value: The top inset, setting only `.top` to this value.
	/// - Returns: A `NSDirectionalEdgeInsets` value, with `.top` set to the given parameter, and everything else set to `0`.
	static func top(_ value: CGFloat) -> NSDirectionalEdgeInsets {
		.with(top: value)
	}
	
	/// Convenience accessor to create a `NSDirectionalEdgeInsets` value with only a bottom inset.
	/// - Parameter value: The bottom inset, setting only `.bottom` to this value.
	/// - Returns: A `NSDirectionalEdgeInsets` value, with `.bottom` set to the given parameter, and everything else set to `0`.
	static func bottom(_ value: CGFloat) -> NSDirectionalEdgeInsets {
		.with(bottom: value)
	}
	
	/// Convenience accessor to create a `NSDirectionalEdgeInsets` value with only a leading inset.
	/// - Parameter value: The leading inset, setting only `.leading` to this value.
	/// - Returns: A `NSDirectionalEdgeInsets` value, with `.leading` set to the given parameter, and everything else set to `0`.
	static func leading(_ value: CGFloat) -> NSDirectionalEdgeInsets {
		.with(leading: value)
	}
	
	/// Convenience accessor to create a `NSDirectionalEdgeInsets` value with only a trailing inset.
	/// - Parameter value: The trailing inset, setting only `.trailing` to this value.
	/// - Returns: A `NSDirectionalEdgeInsets` value, with `.trailing` set to the given parameter, and everything else set to `0`.
	static func trailing(_ value: CGFloat) -> NSDirectionalEdgeInsets {
		.with(trailing: value)
	}
	
	/// Convenience accessor to create a `NSDirectionalEdgeInsets` value with all values set to a given inset.
	/// - Parameter value: The inset, setting all values to this value.
	/// - Returns: A `NSDirectionalEdgeInsets` value, with all values set to the given parameter.
	static func by(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
		.init(insetBy: inset)
	}
}

