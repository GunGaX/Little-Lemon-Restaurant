//
//  TextFields.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 01.06.2023.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .disableAutocorrection(true)
            .font(.regularText())
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
    }
}
