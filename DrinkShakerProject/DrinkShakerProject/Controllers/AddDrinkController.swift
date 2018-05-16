
import UIKit


class AddDrinkController: UIViewController{
    
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getPhotoFile: UITextField!
    @IBOutlet weak var getLocation: UITextField!
    @IBOutlet weak var getNotes: UITextView!
    @IBOutlet weak var getRating: UITextField!
    @IBOutlet weak var getIngredients: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveDrink(_ sender: UIButton) {
        let name : String = getName.text!
        let ingredients : String = getIngredients.text!
        let rating : String = getRating.text!
       // let notes : String = getNotes.text!
       // let location : String = getLocation.text!
        
    }
    
    
}
