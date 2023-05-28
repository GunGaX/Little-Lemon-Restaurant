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
            VStack() {
                
                Image("LLLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Spacer()
                
                Group {
                    Text("Login")
                        .font(.displayFont())
                       
                        
                    Text("Please sign in to continue")
                        .font(.subTitleFont())
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            
                Group {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .textCase(.none)
                        .keyboardType(.emailAddress)
                }
                .font(.regularText())
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 6)
                
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
                        .font(.leadText())
                }
                .buttonStyle(ButtonStyleYellowColorWide())
                
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
