//
//  UserProfile.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI

struct UserProfile: View {
    
//    @StateObject private var viewModel = ViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            
//            Header()
            
            VStack {
                Text("Personal information")
                    .font(.subTitleFont())
                    .bold()
                
                
                Image("profileImagePlaceholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(100)
                
                
                Spacer()
                
                Group {
                    VStack{
                        Text("First name")
                            .font(.sectionCategories())
                            .foregroundColor(.primaryColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("First Name", text: $firstName)
                    }
                    
                    VStack{
                        Text("Last name")
                            .font(.sectionCategories())
                            .foregroundColor(.primaryColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Last Name", text: $lastName)
                    }
                    
                    VStack{
                        Text("Email")
                            .font(.sectionCategories())
                            .foregroundColor(.primaryColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Email", text: $email)
                    }
                }
                .textFieldStyle(MainTextFieldStyle())
                .disableAutocorrection(true)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastname)
                            UserDefaults.standard.set(email, forKey: kEmail)
                        }
                    }) {
                        Text("Save changes")
                            .font(.paragraphText())
                            .bold()
                            .contentShape(Rectangle())
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(ButtonStylePrimaryColor1())
                    
                    Button(action: {
                        
                    }) {
                        Text("Discard changes")
                            .font(.paragraphText())
                            .contentShape(Rectangle())
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                }
                .padding(.bottom)
                
                
                Button(action: {
                    
                }) {
                    Text("Logout")
                        .font(.leadText())
                        .bold()
                        .contentShape(Rectangle())
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(ButtonStyleYellowColorWide())

            }
            .padding([.leading, .bottom, .trailing])
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
