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
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
    }
    
 //   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //
 //   }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        

//      let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell") as! customCell

        cell.photo.image = #imageLiteral(resourceName: "cosmo")
        cell.rating.text = "Rating: 1/5"
        cell.ingredients.text = "1/2 oz lemon juice \n4oz booze"
        //cell.textLabel?.text = drink

        performSegue(withIdentifier: "drinkInfoSegue", sender: self)


        return cell
    }
}
