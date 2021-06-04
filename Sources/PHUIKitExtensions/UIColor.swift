//
//  File.swift
//  
//
//  Created by Benni on 19.11.20.
//

import Foundation
import UIKit


public extension UIColor {
	convenience init(hex: Int, alpha: CGFloat = 1.0) {
		let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
		let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
		let blue = CGFloat((hex & 0xFF)) / 255.0
		
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	convenience init(light: Int, dark: Int) {
		self.init(dynamicProvider: { traitCollection -> UIColor in
			switch traitCollection.userInterfaceStyle {
			case .dark: return UIColor(hex: dark)
			case .light: return UIColor(hex: light)
			case .unspecified: return UIColor(hex: light)
			@unknown default: return UIColor(hex: light)
			}
		})
	}
	
	convenience init(light: UIColor, dark: UIColor) {
		self.init(dynamicProvider: { traitCollection -> UIColor in
			switch traitCollection.userInterfaceStyle {
			case .dark: return dark
			case .light: return light
			case .unspecified: return light
			@unknown default: return light
			}
		})
	}
}
