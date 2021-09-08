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
	///   - symbolicTraits: Optional symbolic traits of the font, not all traits work with all fonts. Default value is `[]`.
	/// - Returns: An instance of `UIFont`, using the given style, weight and design.
	static func preferredFont(
		for style: TextStyle = .body,
		weight: Weight = .regular,
		design: UIFontDescriptor.SystemDesign = .default,
		symbolicTraits: UIFontDescriptor.SymbolicTraits = []
	) -> UIFont {
		if let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
			.withDesign(design)?
			.withSymbolicTraits(symbolicTraits)
		{
			return UIFont(descriptor: descriptor, size: 0)
				.withWeight(weight)
		} else {
			return UIFont.preferredFont(forTextStyle: style)
		}
	}
	
	private func withWeight(_ weight: UIFont.Weight) -> UIFont {
		var attributes = fontDescriptor.fontAttributes
		var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

		traits[.weight] = weight

		attributes[.name] = nil
		attributes[.traits] = traits
		attributes[.family] = familyName

		let descriptor = UIFontDescriptor(fontAttributes: attributes)

		return UIFont(descriptor: descriptor, size: pointSize)
	}


}
