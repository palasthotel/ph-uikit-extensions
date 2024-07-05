//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 21.01.21.
//

import Foundation
import UIKit
import MobileCoreServices
import UniformTypeIdentifiers


public extension UIImage {
	static func inBackground(from url: URL, maxSize size: CGFloat, _ completion: @escaping (UIImage?) -> Void) {
		DispatchQueue.global(qos: .userInitiated).async {
			let image = UIImage(from: url, maxSize: size)!
			DispatchQueue.main.async {
				completion(image)
			}
		}

	}
	
	static func inBackground(from data: Data, maxSize size: CGFloat, _ completion: @escaping (UIImage?) -> Void) {
		DispatchQueue.global(qos: .userInitiated).async {
			let image = UIImage(from: data, maxSize: size)!
			DispatchQueue.main.async {
				completion(image)
			}
		}

	}
	
	convenience init?(from url: URL, maxSize size: CGFloat) {
		let sourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
		
		guard let source = CGImageSourceCreateWithURL(url as CFURL, sourceOptions) else {
			print("Couldn't load image from \(url.absoluteString)")
			return nil
		}
				
		let downsampleOptions = [
			kCGImageSourceCreateThumbnailFromImageAlways: true,
			kCGImageSourceCreateThumbnailWithTransform: true,
			kCGImageSourceThumbnailMaxPixelSize: size * UIScreen.main.scale,
		] as CFDictionary
		
		guard let cgImage = CGImageSourceCreateThumbnailAtIndex(source, 0, downsampleOptions) else {
			return nil
		}
		
		let data = NSMutableData()
		
		guard let imageDestination = CGImageDestinationCreateWithData(data, UTType.jpeg.identifier as CFString, 1, nil) else {
			return nil
		}
		
		CGImageDestinationAddImage(imageDestination, cgImage, nil)
		CGImageDestinationFinalize(imageDestination)
		
		self.init(data: data as Data)
	}
	
	convenience init?(from data: Data, maxSize size: CGFloat) {
		let sourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
		
		guard let source = CGImageSourceCreateWithData(data as CFData, sourceOptions) else {
			print("Couldn't load image from data (Size: \(data.count))")
			return nil
		}
				
		let downsampleOptions = [
			kCGImageSourceCreateThumbnailFromImageAlways: true,
			kCGImageSourceCreateThumbnailWithTransform: true,
			kCGImageSourceThumbnailMaxPixelSize: size * UIScreen.main.scale,
		] as CFDictionary
		
		guard let cgImage = CGImageSourceCreateThumbnailAtIndex(source, 0, downsampleOptions) else {
			return nil
		}
		
		let data = NSMutableData()
		
		guard let imageDestination = CGImageDestinationCreateWithData(data, UTType.jpeg.identifier as CFString, 1, nil) else {
			return nil
		}
		
		CGImageDestinationAddImage(imageDestination, cgImage, nil)
		CGImageDestinationFinalize(imageDestination)
		
		self.init(data: data as Data)
	}
}


public extension Optional where Wrapped == UIImage.Configuration {
	static var smallScale: UIImage.SymbolConfiguration {
		UIImage.SymbolConfiguration(scale: .small)
	}
	static var mediumScale: UIImage.SymbolConfiguration {
		UIImage.SymbolConfiguration(scale: .medium)
	}
	static var largeScale: UIImage.SymbolConfiguration {
		UIImage.SymbolConfiguration(scale: .large)
	}
}
