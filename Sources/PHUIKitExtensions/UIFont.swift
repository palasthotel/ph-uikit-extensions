//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 11.01.21.
//

import Foundation
import UIKit


public extension UIFont {
	/// Convenience access to a dynamic type enabled `UIFont` instance with a given style, weight and design.
	/// - Parameters:
	///   - style: The style of the font. Default value is `.body`.
	///   - weight: The weight of the font. Default value is `.regular`.
	///   - design: The design of the font. Default value is `.default`.
	/// - Returns: An instance of `UIFont`, using the given style, weight and design.
	static func preferredFont(for style: TextStyle = .body, weight: Weight = .regular, design: UIFontDescriptor.SystemDesign = .default) -> UIFont {
		let fontSize = UIFont.preferredFont(forTextStyle: style).pointSize
		if let descriptor = UIFont.systemFont(ofSize: fontSize, weight: weight).fontDescriptor.withDesign(design) {
			return UIFont(descriptor: descriptor, size: fontSize)
		} else {
			return UIFont.preferredFont(forTextStyle: style)
		}
	}

}
