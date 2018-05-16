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
    var drinks: [String] = ["cosmopolitan", "martini", "jack"]
    var ingredientsList: [String] = [""]
    var ratingList : [String] = ["4/5", "3/5", "4/5", "2/5"]
    var photoList : [UIImage] = [#imageLiteral(resourceName: "cosmo")]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //    }
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let drink = drinks[indexPath.row]
        let ingredients1 = ingredientsList[indexPath.row]
        let ratings1 = ratingList[indexPath.row]
        let photo1 = photoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell") as! customCell
        
        
        cell.drinkName.text = drink
        cell.photo.image = photo1
        cell.rating.text = ratings1
        cell.ingredients.text = ingredients1
        //cell.textLabel?.text = drink
       // performSegue(withIdentifier: "drinkInfoSegue", sender: self)
        
        return cell
    }
}
