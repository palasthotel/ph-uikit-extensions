//
//  UIApplication.swift
//  Bookmarks
//
//  Created by Benni on 17.02.20.
//  Copyright © 2020 Ben Boecker. All rights reserved.
//

import Foundation
import UIKit


public extension UIApplication {
	/// Returns a `Bool` indicating whether the app is currently running in a unit test.
	var isRunningInUnitTest: Bool {
		ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
	}
	
	/// Returns the value of the `CFBundleShortVersionString` entry in the *Info.plist* file. This indicates the app version, for example `"1.2.3"`.
	var currentVersion: String {
		let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
		return appVersion
	}
	
	/// Returns the value of the `CFBundleVersion` entry in the *Info.plist* file. This indicates the build number, for example `"42"`.
	var currentBuildNumber: String {
		let appVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
		return appVersion
	}
	
	/// Returns the device type, for example `iPhone 15,3`.
	var currentDevice: String {
		if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
		var sysinfo = utsname()
		uname(&sysinfo)
		return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
	}
}

