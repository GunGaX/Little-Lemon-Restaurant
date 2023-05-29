//
//  Menu.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 12.05.2023.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var dataLoaded = false
    
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    @State var discountIsEnabled = true
    
    @State var searchText = ""
    @State var isKeyboardVisible = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Header()
                
                VStack {
                    if !isKeyboardVisible {
                        withAnimation() {
                            Hero()
                                .frame(minHeight: 220)
                        }
                    }
                    
                    TextField("Search menu", text: $searchText)
                    
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(.white)
                        .cornerRadius(8)
                }
                    .padding()
                    .background(Color.primaryColor1)
                    .frame(maxWidth: .infinity)
                
                
                Text("ORDER FOR DELIVERY!")
                    .font(.sectionTitle())
                    .foregroundColor(.highlightColor2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Toggle("Starters", isOn: $startersIsEnabled)
                        Toggle("Mains", isOn: $mainsIsEnabled)
                        Toggle("Desserts", isOn: $dessertsIsEnabled)
                        Toggle("Drinks", isOn: $drinksIsEnabled)
                        Toggle("Discounts", isOn: $discountIsEnabled)
                    }
                    .toggleStyle(MyToggleStyle())
                    .padding(.horizontal)
                }
                
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List(dishes) { dish in
                        ZStack {
                            NavigationLink(destination: EmptyView()) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            DishItem(dish: dish)
                        }
                    }
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                    .listStyle(.plain)
                }
            }
            .onAppear() {
                // Kick-off the data from url
                if !dataLoaded {
                    MenuList.getMenuData(context: viewContext)
                    dataLoaded = true
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                        withAnimation {
                            self.isKeyboardVisible = true
                        }
                        
                    }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                withAnimation {
                    self.isKeyboardVisible = false
                }
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    }
}

struct Menu_Previews: PreviewProvider {

    var menuModel: MenuList

    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
