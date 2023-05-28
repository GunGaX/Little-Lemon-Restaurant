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
    
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    
    @State var searchText = ""
    
    @State var dataLoaded = false

    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Text("Little Lemon Restaurant")
                        .font(.subTitleFont())
                        .bold()
                    HStack {
                        
                        Spacer()
                        
                        Text("Lviv")
                            .bold()
                            .padding(.vertical, 10.0)
                            .padding(.trailing, 30.0)
                        
                    }
                    
                    Text("We are family owned Mediterranean restaurant, focused on tradional recipes served with a modern twist.")
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
