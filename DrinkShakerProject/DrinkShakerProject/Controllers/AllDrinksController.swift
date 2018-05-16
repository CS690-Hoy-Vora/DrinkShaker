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
    var drinks: [String] = ["Cosmopolitan", "Martini", "Jack and Coke", "Margarita", "Bloody Mary", "Mojito", "Manhattan", "Lemon Drop"]
    var ingredientsList: [String] = ["1/2 oz lime juice \n1/4 oz cranberry juice \n1 1/2 oz vodka\nShake Well", "1/4 oz dry vermouth \n2 oz vodka or gin \nStir", "1 1/2 oz Jack Daniels \nFill with ice and coke", "3/4 oz lime juice \n1/4 oz tripel sec \n2 oz tequila", "1 1/2 oz vodka \n1/2 oz lemon juice \n1/4 oz olive juice \ndash of tobasco \nTop off with tomato juice \nshake well", "1 sugar cube \n6-8 mint leaves \n3/4oz lime juice \n muddle \nshake well \nstrain over ice", "2 oz of bourbon or rye \n3-4 dashes of angostura bitters \nstir and strain into martini glass", "3/4 oz lemon juice \n1/2 oc simple syrup \n1/2 oz tripel sec \n1 1/2oz of vodka \nshake well and strain into sugar rimmed glass"]
    
    var ratingList : [String] = ["Rating: 4/5", "Rating: 3/5", "Rating: 4/5", "Rating: 2/5", "Rating: 5/5", "Rating: 4/5", "Rating: 3/5", "Rating: 4/8"]
    var photoList : [UIImage] = [#imageLiteral(resourceName: "cosmo"), #imageLiteral(resourceName: "martini"), #imageLiteral(resourceName: "jd"), #imageLiteral(resourceName: "marg"), #imageLiteral(resourceName: "bloody"), #imageLiteral(resourceName: "mojito"), #imageLiteral(resourceName: "manhattan"), #imageLiteral(resourceName: "drop") ]
    
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
