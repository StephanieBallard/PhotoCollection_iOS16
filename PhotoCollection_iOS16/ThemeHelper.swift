//
//  ThemeHelper.swift
//  PhotoCollection_iOS16
//
//  Created by Stephanie Ballard on 3/26/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "Theme Preference"
}

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToPink() {
        UserDefaults.standard.set("Pink", forKey: .themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: .themePreferenceKey)
    }
}
