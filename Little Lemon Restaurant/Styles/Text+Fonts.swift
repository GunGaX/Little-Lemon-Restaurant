//
//  Text+Fonts.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 01.06.2023.
//

import SwiftUI

extension Text {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.primaryColor1)
            .font(.custom("Karla-Bold", size: 13))
    }
}

extension Font {
    static func displayFont() -> Font {
        return Font.custom("Markazi Text", size: 52).weight(.bold)
    }
    
    static func subTitleFont() -> Font {
        return Font.custom("Markazi Text", size: 32).weight(.medium)
    }
    
    static func leadText() -> Font {
        return Font.custom("Karla", size: 18).weight(.medium)
    }
    
    static func regularText() -> Font {
        return Font.custom("Markazi Text", size: 22)
    }
    
    static func sectionTitle() -> Font {
        return Font.custom("Karla", size: 18).weight(.black)
    }
    
    static func sectionCategories() -> Font {
        return Font.custom("Karla", size: 16).weight(.heavy)
    }
    
    static func paragraphText() -> Font {
        return Font.custom("Karla", size: 16)
    }
    
    static func highlightText() -> Font {
        return Font.custom("Karla", size: 22).weight(.medium)
    }
}
