//
//  File.swift
//  
//
//  Created by Benni on 25.05.20.
//

import Foundation
import UIKit



public extension UICollectionView {
	
	/// Dequeues a registered `UICollectionViewCell`, based on it's `.identifier` property. Crashes if the cell is not registered.
	/// - Parameter indexPath: The index path of the cell that is to be dequeued
	/// - Returns: A dequeued `UICollectionViewCell` instance.
	func dequeueCell<T: UICollectionViewCell>(with indexPath: IndexPath) -> T {
		dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
	}
	
	/// Dequeues a registered `UICollectionReusableView` as a supplementary view, based on it's `.identifier` property. Crashes if the cell is not registered.
	/// - Parameters:
	///   - kind: The kind of the supplementary view.
	///   - indexPath: The index path of the supplementary view that is to be dequeued
	/// - Returns: A dequeued `UICollectionReusableView` instance.
	func dequeueReusableSupplementaryView<T: UICollectionReusableView>(of kind: String, at indexPath: IndexPath) -> T {
		dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.identifier, for: indexPath) as! T
	}
}


