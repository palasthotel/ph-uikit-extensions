//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 15.12.20.
//

import Foundation
import UIKit


public extension UICollectionViewDiffableDataSource {
	func section(at indexPath: IndexPath) -> SectionIdentifierType {
		section(at: indexPath.section)
	}
	
	func section(at sectionIndex: Int) -> SectionIdentifierType {
		snapshot().sectionIdentifiers[sectionIndex]
	}
	
	func reload(_ item: ItemIdentifierType, animated: Bool = true) {
		reload([item], animated: animated)
	}
	
	func reload(_ items: [ItemIdentifierType], animated: Bool = true) {
		var snapshot = self.snapshot()
		snapshot.reloadItems(items)
		apply(snapshot, animatingDifferences: animated)
	}
	
	func reloadSection(withIdentifier identifier: SectionIdentifierType, animated: Bool = true) {
		var snapshot = self.snapshot()
		snapshot.reloadSections([identifier])
		apply(snapshot, animatingDifferences: animated)
	}

}
