//
//  ViewModel.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 28.05.2023.
//

import Foundation

public let kFirstName = "first name key"
public let kLastname = "second name key"
public let kEmail = "email key"

public let kIsloggedIn = "is logged in key"


class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastname) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Published var isLoggedIn = UserDefaults.standard.bool(forKey: kIsloggedIn)
    
}
