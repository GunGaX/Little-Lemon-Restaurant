//
//  Hero.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 29.05.2023.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.displayFont())
                .foregroundColor(.primaryColor2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                VStack {
                    
                    
                    Text("Lviv")
                        .font(.subTitleFont())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("We are family owned Mediterranean restaurant, focused on tradional recipes served with a modern twist.")
                        .font(.leadText())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                VStack {
                    
                    Spacer()
                    
                    Image("HeroImage")
                        .resizable()
                        .scaledToFill()
                        .frame( width: 150, height: 150)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
            .padding()
            .background(Color.primaryColor1)
            .frame(maxWidth: .infinity, maxHeight: 250)
    }
}
