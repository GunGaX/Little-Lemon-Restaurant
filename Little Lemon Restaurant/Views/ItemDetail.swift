//
//  ItemDetail.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 31.05.2023.
//

import SwiftUI

struct ItemDetail: View {
    
    let dish: Dish
    
    var body: some View {
        VStack {
            Text(dish.title ?? "")
                .font(.displayFont())
                .foregroundColor(.primaryColor1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                
                Text(dish.category ?? "")
                    .font(.subTitleFont())
                    .foregroundColor(.primaryColor1)
                    
                Spacer()
                
                Text("$" + "\(dish.price)")
                    .font(.subTitleFont())
                    .foregroundColor(.primaryColor1)
                    
            }
            .padding()
            
            Text(dish.dishDescription ?? "")
                .font(.leadText())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Spacer()
            
            
        }
    }
}
