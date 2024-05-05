//
//  Application.swift
//  Rumble
//
//  Created by Brian Sakhuja on 1/16/24.
//

import Foundation

enum AppVersionProvider {
    static var appVersion: String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            fatalError("CFBundleShortVersionString should not be missing from info dictionary")
        }
        return version
    }
    
    static var buildNumber: String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String else {
            fatalError("CFBundleVersion should not be missing from info dictionary")
        }
        return "(" + version + ")"
    }
    
    static var versionAndBuild: String {
        return "v" + appVersion + " " +  buildNumber
    }
}
