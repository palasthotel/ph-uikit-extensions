//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 11.01.21.
//

import Foundation
import UIKit



public extension UIView {
	func recursiveSubviews() -> [UIView] {
		var views = subviews
		for subview in subviews {
			views += subview.recursiveSubviews()
		}
		return views
	}
	
	func recursiveSubviews<T: UIView>() -> [T] {
		var views: [T] = []
		for subview in subviews {
			if let s = subview as? T {
				views.append(s)
			}
			views += subview.recursiveSubviews()
		}
		return views
	}
	
	
	enum Edge {
		public static var top: Edge { Edge.top(inset: 0.0) }
		public static var bottom: Edge { Edge.bottom(inset: 0.0) }
		public static var leading: Edge { Edge.leading(inset: 0.0) }
		public static var trailing: Edge { Edge.trailing(inset: 0.0) }
		case top(inset: CGFloat), leading(inset: CGFloat), trailing(inset: CGFloat), bottom(inset: CGFloat)
	}
	typealias Constraints = (leading: NSLayoutConstraint?, top: NSLayoutConstraint?, bottom: NSLayoutConstraint?, trailing: NSLayoutConstraint?)
	
	@discardableResult func pin(to layoutGuide: UILayoutGuide, insetBy insetValue: CGFloat) -> Constraints {
		pin(to: layoutGuide, insets: UIEdgeInsets(top: insetValue, leading: insetValue, bottom: insetValue, trailing: insetValue))
	}
	
	@discardableResult func pin(to view: UIView, insetBy insetValue: CGFloat) -> Constraints {
		pin(to: view, insets: UIEdgeInsets(top: insetValue, leading: insetValue, bottom: insetValue, trailing: insetValue))
	}
	
	@discardableResult func pin(to layoutGuide: UILayoutGuide, insets: UIEdgeInsets = .zero) -> Constraints {
		pin(to: layoutGuide, edges: [
			.top(inset: insets.top),
			.leading(inset: insets.left),
			.trailing(inset: insets.right),
			.bottom(inset: insets.bottom),
		])
	}
	
	@discardableResult func pin(to view: UIView, insets: UIEdgeInsets = .zero) -> Constraints {
		pin(to: view, edges: [
			.top(inset: insets.top),
			.leading(inset: insets.left),
			.trailing(inset: insets.right),
			.bottom(inset: insets.bottom),
		])
	}
	
	@discardableResult func pin(to layoutGuide: UILayoutGuide, edges: [Edge]) -> Constraints {
		self.translatesAutoresizingMaskIntoConstraints = false
		
		if let view = layoutGuide.owningView, !view.subviews.contains(self) {
			view.addSubview(self)
		}
		
		var leadingConstraint: NSLayoutConstraint?
		var topConstraint: NSLayoutConstraint?
		var bottomConstraint: NSLayoutConstraint?
		var trailingConstraint: NSLayoutConstraint?
		
		for edge in edges {
			switch edge {
			case .top(let value):
				topConstraint = topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: value)
				topConstraint?.isActive = true
			case .leading(let value):
				leadingConstraint = leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: value)
				leadingConstraint?.isActive = true
			case .trailing(let value):
				trailingConstraint = trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -value)
				trailingConstraint?.isActive = true
			case .bottom(let value):
				bottomConstraint = bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -value)
				bottomConstraint?.isActive = true
			}
		}
		
		return (leading: leadingConstraint, top: topConstraint, bottom: bottomConstraint, trailing: trailingConstraint)
	}
	
	@discardableResult func pin(to view: UIView, edges: [Edge]) -> Constraints {
		self.translatesAutoresizingMaskIntoConstraints = false
		
		if !view.subviews.contains(self) {
			view.addSubview(self)
		}
		
		var leadingConstraint: NSLayoutConstraint?
		var topConstraint: NSLayoutConstraint?
		var bottomConstraint: NSLayoutConstraint?
		var trailingConstraint: NSLayoutConstraint?
		
		for edge in edges {
			switch edge {
			case .top(let value):
				topConstraint = topAnchor.constraint(equalTo: view.topAnchor, constant: value)
				topConstraint?.isActive = true
			case .leading(let value):
				leadingConstraint = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: value)
				leadingConstraint?.isActive = true
			case .trailing(let value):
				trailingConstraint = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -value)
				trailingConstraint?.isActive = true
			case .bottom(let value):
				bottomConstraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -value)
				bottomConstraint?.isActive = true
			}
		}
		
		return (leading: leadingConstraint, top: topConstraint, bottom: bottomConstraint, trailing: trailingConstraint)
		
	}
	
	func center(in view: UIView, offset: CGPoint = .zero) {
		self.translatesAutoresizingMaskIntoConstraints = false
		
		if !view.subviews.contains(self) {
			view.addSubview(self)
		}
		
		NSLayoutConstraint.activate([
			self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x),
			self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y),
		])
	}
	
	func centerHorizontally(in view: UIView, offset: CGPoint = .zero) {
		self.translatesAutoresizingMaskIntoConstraints = false
		
		if !view.subviews.contains(self) {
			view.addSubview(self)
		}
		
		NSLayoutConstraint.activate([
			self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x),
		])
	}
	
	func centerVertically(in view: UIView, offset: CGPoint = .zero) {
		self.translatesAutoresizingMaskIntoConstraints = false
		
		if !view.subviews.contains(self) {
			view.addSubview(self)
		}
		
		NSLayoutConstraint.activate([
			self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y),
		])
	}
	
	@discardableResult func setHeight(greaterThanOrEqual to: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		assert(superview != nil)
		
		let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: to)
		constraint.isActive = true
		return constraint
	}
	
	@discardableResult func setHeight(equal to: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		assert(superview != nil)
		
		
		let constraint = heightAnchor.constraint(equalToConstant: to)
		constraint.isActive = true
		return constraint
	}
	
	@discardableResult func setHeight(lessThanOrEqual to: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		assert(superview != nil)
				
		let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: to)
		constraint.isActive = true
		return constraint
	}
	
	@discardableResult func setWidth(greaterThanOrEqual to: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		assert(superview != nil)
		
		let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: to)
		constraint.isActive = true
		return constraint
	}
	
	@discardableResult func setWidth(equal to: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		assert(superview != nil)
				
		let constraint = widthAnchor.constraint(equalToConstant: to)
		constraint.isActive = true
		return constraint
	}
	
	@discardableResult func setWidth(lessThanOrEqual to: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		assert(superview != nil)
		
		let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: to)
		constraint.isActive = true
		return constraint
	}
}
