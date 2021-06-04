//
//  File.swift
//  
//
//  Created by Benni on 11.06.20.
//

import Foundation
import UIKit



public extension UILabel {

	func heightOfText(for width: CGFloat) -> CGFloat {
		(text ?? "").heightWithConstrainedWidth(width: width, font: font)
	}
	
}

extension String {
	func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect,
											options: [.usesLineFragmentOrigin, .usesFontLeading],
											attributes: [NSAttributedString.Key.font: font],
											context: nil
		)
		
		return boundingBox.height
	}
}

