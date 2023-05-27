//
//  MenuItem.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 19.05.2023.
//

import Foundation

struct MenuItem: Decodable {
    
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
}
