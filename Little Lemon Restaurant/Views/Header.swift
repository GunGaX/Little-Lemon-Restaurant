//
//  Header.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 29.05.2023.
//

import SwiftUI

struct Header: View {
    
    @State var isLoggedIn = false
    
    var body: some View {
        ZStack {
            
            Image("LLLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            HStack {
                Spacer()
                
                Image("profileImagePlaceholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(100)
                    .padding()
            }
        }
        .frame(maxHeight: 60)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Header()
            
            Spacer()
        }
            
    }
}
