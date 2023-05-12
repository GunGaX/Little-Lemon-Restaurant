//
//  Menu.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Group {
                Text("Little Lemon Restaurant")
                    .font(.title2)
                    .bold()
                HStack {
                    
                    Spacer()
                    
                    Text("Lviv")
                        .bold()
                        .padding(20)
                    
                }
                
                Text("Here you can choose dishes to order and read information about them")
            }
            
            List {
                
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
