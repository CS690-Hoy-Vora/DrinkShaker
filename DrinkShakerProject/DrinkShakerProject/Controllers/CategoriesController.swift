
import UIKit
import RealmSwift

class CategoriesController: UIViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let liquor = segue.identifier
        
        let destination = segue.destination as! CategoryChosenController
        destination.liquorType = liquor
    }
}
