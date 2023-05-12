//
//  Onboarding.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI

let kFirstName = "first name key"
let kLastname = "second name key"
let kEmail = "email key"

let kIsloggedIn = "is logged in key"

struct Onboarding: View {
    
    @State var isLoggedIn = false
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Spacer()
                
                Group {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(16)
                
                Spacer()
                
                Button(action: {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastname)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        
                        UserDefaults.standard.set(true, forKey: kIsloggedIn)
                        
                        isLoggedIn = true
                    }
                }) {
                    Text("Register")
                        .foregroundColor(Color.white)
                        .font(.title3)
                        .bold()
                        .contentShape(Rectangle())
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(16)
                
                
                
            }
            .padding()
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsloggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
