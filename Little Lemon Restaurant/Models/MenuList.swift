//
//  MenuList.swift
//  Little Lemon Restaurant
//
//  Created by Dmytro Savka on 19.05.2023.
//

import Foundation
import CoreData

struct MenuList: Decodable {
    
    let menu: [MenuItem]
    
    static func getMenuData(context: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            
            let decoder = JSONDecoder()
            
            if let menuList = try? decoder.decode(MenuList.self, from: data!) {
                for item in menuList.menu {
                    let newDish = Dish(context: context)
                    newDish.title = item.title
                    if let price = Float(item.price) {
                        newDish.price = price
                    }
                    newDish.dishDescription = item.description

                    
                    // Fixing coursera provided JSON bug (2 items don't have image)
                    if item.title == "Grilled Fish" {
                        newDish.image = "https://www.saveur.com/uploads/2019/09/26/16-220816-PAMU-PESCADO_EMBARAZADO-018-scaled.jpg?auto=webp"
                    } else if newDish.image == nil {
                        newDish.image = item.image
                    }
                    
                    if item.title == "Lemon Desert" {
                        newDish.image = "https://www.jocooks.com/wp-content/uploads/2014/06/lemon-magic-cake-1-6-1.jpg"
                    } else if newDish.image == nil {
                        newDish.image = item.image
                    }
                    
                    
                    newDish.category = item.category
                    
                }
                try? context.save()
                
            } else {
                print("Error while decoding data!!!")
            }
            
        }
        
        dataTask.resume()
    }
    
}
