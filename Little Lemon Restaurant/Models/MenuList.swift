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
            
            do {
                let decoder = JSONDecoder()
                
                let menuList = try? decoder.decode(MenuList.self, from: data!)
                
                menuList?.menu.forEach { menuItem in
                    let dish = Dish(context: context)
                    dish.title = menuItem.title
                    dish.price = menuItem.price
                }
                try? context.save()
            }
        }
        
        dataTask.resume()
    }
    
}
