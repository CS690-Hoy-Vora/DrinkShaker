//
//  AllDrinksController.swift
//  DrinkShakerProject
//
//  Created by Lina Del Bondio on 5/15/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

import UIKit


class allCell: UITableViewCell {
    
    
}

class AllDrinksController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
    }
    var drinks: [String] = ["cosmo", "martini", "jack"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drink = drinks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell") as! customCell
        
        cell.drinkName.text = drink
        cell.photo.image = #imageLiteral(resourceName: "cosmo")
        cell.rating.text = "Rating: 1/5"
        cell.ingredients.text = "1/2 oz lemon juice \n4oz booze"
        //cell.textLabel?.text = drink
        return cell
    }
}
