
import UIKit
import RealmSwift

class AddDrinkController: UIViewController{
    
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getLocation: UITextField!
    @IBOutlet weak var getNotes: UITextView!
    @IBOutlet weak var getRating: UITextField!
    @IBOutlet weak var getIngredients: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var text = ""
    @IBAction func getValues ()
    {
        text = getName.text!
    }
    
    let realm = try! Realm()
    
    
    let drink = Drinks()
    
}
