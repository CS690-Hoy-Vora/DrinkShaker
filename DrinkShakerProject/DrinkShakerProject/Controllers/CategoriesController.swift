// This page just lists the categories, and when a category is selected,
// Sends the selected category to the Category Chosen controller

import UIKit
import RealmSwift

class CategoriesController: UIViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let liquor:String? = segue.identifier
        
        let destination = segue.destination as! CategoryChosenController
        destination.liquorType = liquor
    }
}
