//
//  File.swift
//  
//
//  Created by Benni on 25.05.20.
//

import Foundation
import UIKit


public extension UICollectionViewCell {
	
	/// Registers this cell`s `.nib` in the given collection view.
	/// - Parameter collectionView: The collection view that the nib is registered on.
	static func registerCellNib(in collectionView: UICollectionView) {
		collectionView.register(nib, forCellWithReuseIdentifier: Self.identifier)
	}
	
	/// Registers this cell in the given collection view.
	/// - Parameter collectionView: The collection view that the cell is registered on.
	static func registerCell(in collectionView: UICollectionView) {
		collectionView.register(self, forCellWithReuseIdentifier: Self.identifier)
	}
	
	
}

public extension UICollectionReusableView {
	
	/// Registers the `.nib`-property as a supplementary view in the given collection view.
	/// - Parameters:
	///   - type: The type of the supplementary view.
	///   - collectionView: The collection view that the nib is registered on.
	static func registerSupplementaryNib(type: String, in collectionView: UICollectionView) {
		collectionView.register(nib, forSupplementaryViewOfKind: type, withReuseIdentifier: identifier)
	}
	
	/// Registers this class as a supplementary view in the given collection view.
	/// - Parameters:
	///   - type: The type of the supplementary view.
	///   - collectionView: The collection view that the class is registered on.
	static func registerSupplementary(type: String, in collectionView: UICollectionView) {
		collectionView.register(self, forSupplementaryViewOfKind: type, withReuseIdentifier: identifier)
	}
	
	/// Returns a `UINib` object from a file with the same name as the calling class.
	static var nib: UINib {
		UINib(nibName: String(describing: "\(self)"), bundle: nil)
	}
	
	/// A identifier that consists of the name of this class.
	static var identifier: String {
		String(describing: "\(self)")
	}

}

