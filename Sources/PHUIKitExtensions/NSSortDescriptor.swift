//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 27.06.21.
//

import Foundation


public extension NSSortDescriptor {
	static func ascending<Root, Value>(_ keyPath: KeyPath<Root, Value>) -> NSSortDescriptor {
		NSSortDescriptor.init(keyPath: keyPath, ascending: true)
	}
	
	static func descending<Root, Value>(_ keyPath: KeyPath<Root, Value>) -> NSSortDescriptor {
		NSSortDescriptor.init(keyPath: keyPath, ascending: false)
	}
}
