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
}
