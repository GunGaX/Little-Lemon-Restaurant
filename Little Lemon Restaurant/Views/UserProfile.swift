//
//  UserProfile.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastname)
    let email = UserDefaults.standard.string(forKey: kEmail)
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal information")
                .font(.title2)
                .bold()
            
            Spacer()
            
            Image("profileImagePlaceholder")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(16)
            
            Spacer()
                
            Group {
                HStack {
                    Text("First Name :")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text(firstName ?? "No info")
                        .font(.title2)
                        .bold()

                    
                    Spacer()
                }
                HStack {
                    Text("Last Name :")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text(lastName ?? "No info")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                }
                HStack {
                    Text("Email :          ")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text(email ?? "No info")
                        .font(.title2)
                        .bold()
                        .lineLimit(1)
                    
                    Spacer()
                }
            }
            .padding(.vertical, 10)
            
            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(false, forKey: kIsloggedIn)
                
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Logout")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .bold()
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 50)
            .background(Color.red)
            .cornerRadius(16)
        }
        .padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
