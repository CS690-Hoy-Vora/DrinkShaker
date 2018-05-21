//
//  AllDrinksController.swift
//  DrinkShakerProject
//
//  Created by Lina Del Bondio on 5/15/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

import UIKit
import RealmSwift

class AllDrinksController: UITableViewController {
    
    var drinkItems: Results<Drinks>?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        
        loadDrinks()
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDrinkInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DrinkInfoController
        
        destinationVC.indexPath = Int(tableView.indexPathForSelectedRow!.row)
    }

    
    func loadDrinks() {
        drinkItems = realm.objects(Drinks.self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! customCell

        cell.drinkName?.text = drinkItems?[indexPath.row].name ?? "No Drinks in Recipe Book"
        cell.ingredients?.text = drinkItems?[indexPath.row].ingredients
        cell.rating?.text = "\(drinkItems![indexPath.row].rating)/5"
//        cell.photo.image = #imageLiteral(resourceName: "cosmo")
//        cell.rating.text = "Rating: 1/5"
//        cell.ingredients.text = "1/2 oz lemon juice \n4oz booze"
//        cell.textLabel?.text = drink

//        performSegue(withIdentifier: "drinkInfoSegue", sender: self)


        return cell
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("SHaken!!!!!!")
    }
    
    
}
