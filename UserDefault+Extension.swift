//
//  UserDefault+Extension.swift
//  CodeVault
//
//  Created by Rattanakoudom Sambath on 12/9/23.
//

import Foundation

private struct AppStorage {
  
    private init() {}

    static let displayAdsBanner = "App.DisplayAdsBanner"
}

extension UserDefaults {
    var isDisplayAdsBanner: Bool {
        get {
            UserDefaults.standard.bool(forKey: AppStorage.displayAdsBanner)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: AppStorage.displayAdsBanner)
        }
    }
}

// MARK: - Usage
UserDefaults.standard.isDisplayAdsBanner = true // Set
UserDefaults.standard.isDisplayAdsBanner // Retrive
