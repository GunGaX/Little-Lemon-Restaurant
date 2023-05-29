//
//  Home.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .navigationBarBackButtonHidden()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                
                .tabItem({
                Label("Menu", systemImage: "list.dash")
                })
            
            UserProfile()
                .tabItem({
                Label("Profile", systemImage: "square.and.pencil")
                })
                
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
