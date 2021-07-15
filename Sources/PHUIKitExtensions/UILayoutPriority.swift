//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 15.07.21.
//

import Foundation
import UIKit



extension UILayoutPriority: ExpressibleByIntegerLiteral {
	public init(integerLiteral value: Int) {
		self = UILayoutPriority(Float(value))
	}
}
