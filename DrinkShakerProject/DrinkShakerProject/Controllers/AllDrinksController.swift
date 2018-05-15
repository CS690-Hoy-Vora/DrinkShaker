//
//  AllDrinksController.swift
//  DrinkShakerProject
//
//  Created by Lina Del Bondio on 5/15/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

import UIKit
import CoreData

class allCell: UITableViewCell {
    
    
}

class AllDrinksController: UITableViewController {
    
    var drinks = [Drinks]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let drink = drinks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath)
        
        cell.textLabel?.text = drink.name
        
        return cell
    }
}
