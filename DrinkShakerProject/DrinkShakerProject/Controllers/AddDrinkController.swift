
import UIKit
import RealmSwift

class AddDrinkController: UIViewController{
    
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getLocation: UITextField!
    @IBOutlet weak var getNotes: UITextView!
    @IBOutlet weak var getRating: UITextField!
    @IBOutlet weak var getIngredients: UITextView!
    
    
    //let drink = Drinks(name: String, ingredients: <#T##String#>, rating: <#T##Int#>, location: <#T##String#>, notes: <#T##String#>, photo: <#T##String#>)
    
    let realm = try! Realm()
}
