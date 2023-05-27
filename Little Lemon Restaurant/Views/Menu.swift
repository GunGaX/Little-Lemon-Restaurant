//
//  Menu.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
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
                        .padding(.vertical, 10.0)
                        .padding(.trailing, 30.0)
                    
                }
                
                Text("Here you can choose dishes to order and read information about them")
            }
            
            List {
                
            }
        }
        .onAppear() {
            // Kick-off the data from url            
        }
    }
}

//struct Menu_Previews: PreviewProvider {
//
//    var menuModel: MenuList
//
//    static var previews: some View {
//        Menu(menuModel: menuModel)
//    }
//}
