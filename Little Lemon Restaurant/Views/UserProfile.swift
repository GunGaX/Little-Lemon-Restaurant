//
//  UserProfile.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI

struct UserProfile: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView {    
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
                
                Text("Email Nofitications")
                    .font(.highlightText())
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 25)
                
                VStack {
                    Toggle("Order statuses", isOn: $orderStatuses)
                    Toggle("Password changes", isOn: $passwordChanges)
                    Toggle("Special offers", isOn: $specialOffers)
                    Toggle("Newsletter", isOn: $newsletter)
                }
                .padding()
                .font(Font.leadText())
                .toggleStyle(CheckboxStyle())
                .foregroundColor(.primaryColor1)
                
                HStack {
                    
                    Button(action: {
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                            UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                            UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                            UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                            
                            viewModel.firstName = firstName
                            viewModel.lastName = lastName
                            viewModel.email = email
                            
                            viewModel.orderStatuses = orderStatuses
                            viewModel.passwordChanges = passwordChanges
                            viewModel.specialOffers = specialOffers
                            viewModel.newsletter = newsletter
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
                        firstName = viewModel.firstName
                        lastName = viewModel.lastName
                        email = viewModel.email
                        
                        orderStatuses = viewModel.orderStatuses
                        passwordChanges = viewModel.passwordChanges
                        specialOffers = viewModel.specialOffers
                        newsletter = viewModel.newsletter
                    }) {
                        Text("Discard changes")
                            .font(.paragraphText())
                            .contentShape(Rectangle())
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                }
                .padding(.vertical)
                
                
                Button(action: {
                    UserDefaults.standard.set(false, forKey: kIsloggedIn)
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Log out")
                        .font(.leadText())
                        .bold()
                        .contentShape(Rectangle())
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(ButtonStyleYellowColorWide())
                
            }
            .padding([.leading, .bottom, .trailing])
            
            
        }
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
            
            orderStatuses = viewModel.orderStatuses
            passwordChanges = viewModel.passwordChanges
            specialOffers = viewModel.specialOffers
            newsletter = viewModel.newsletter
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
