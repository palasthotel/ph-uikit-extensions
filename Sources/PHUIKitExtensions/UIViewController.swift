//
//  UIViewController.swift
//  Grow
//
//  Created by Benjamin Böcker on 21.12.20.
//

import Foundation
import UIKit



public extension UIViewController {
	
	/// `true` if the view controller is currently displayed in th `.compect` size class.
	var isCompact: Bool {
		traitCollection.horizontalSizeClass == .compact
	}
	
	/// Includes the neccessary methods `.willMove(toParent: self)` and `.didMove(toParent: self)`
	func add(childViewController: UIViewController) {
		addChild(childViewController)
		view.addSubview(childViewController.view)
		childViewController.didMove(toParent: self)
	}
	
	/// Includes `willMode(toParent: nil)` method and removes the view from it's superview.
	func remove() {
		willMove(toParent: nil)
		view.removeFromSuperview()
		removeFromParent()
	}

	/// Recursively finds the first child view controller of the implicited type.
	func firstChild<T>() -> T? {
		if let child = (children.first { $0 is T } as? T) {
			return child
		} else {
			for child in children {
				if let recursiveChild: T = child.firstChild() {
					return recursiveChild
				}
			}
			return nil
		}
	}
	
	func showPopover(_ controller: UIViewController, sourceView: UIView, directions: UIPopoverArrowDirection? = nil) {
		let presentationController = PopoverController.configurePresentation(forController: controller)
		presentationController.sourceView = sourceView
		presentationController.sourceRect = sourceView.bounds
		presentationController.permittedArrowDirections = directions ?? popoverDirections
		controller.view.backgroundColor = .secondarySystemBackground
		
		self.present(controller, animated: true)
	}
	
	var popoverDirections: UIPopoverArrowDirection {
		traitCollection.horizontalSizeClass == .compact ? [.down, .up] : .any
	}
	
	enum State<Content> {
		case empty
		case loading(message: String)
		case hasContent(Content)
		
		public var isEmpty: Bool {
			switch self {
			case .empty: return true
			case .loading: return false
			case .hasContent: return false
			}
		}
		
		public var loadingMessage: String {
			switch self {
			case .empty: return ""
			case .loading(let message): return message
			case .hasContent: return ""
			}
		}
		
		public var content: Content? {
			switch self {
			case .empty: return nil
			case .loading: return nil
			case .hasContent(let content): return content
			}
		}
	}
}


class PopoverController : NSObject, UIPopoverPresentationControllerDelegate {
	private static let sharedInstance = PopoverController()
	
	private override init() {
		super.init()
	}
	
	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		return .none
	}
	
	static func configurePresentation(forController controller : UIViewController) -> UIPopoverPresentationController {
		controller.modalPresentationStyle = .popover
		let presentationController = controller.presentationController as! UIPopoverPresentationController
		presentationController.delegate = PopoverController.sharedInstance
		
		return presentationController
	}
	
	
}

