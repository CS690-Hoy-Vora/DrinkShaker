
import UIKit

protocol ClassAddDrinkDelegate : class {
    func addInformation(name1 : String, ingr1 : String, rate1 : String)
}
class AddDrinkController: UIViewController{
    
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getPhotoFile: UITextField!
    @IBOutlet weak var getLocation: UITextField!
    @IBOutlet weak var getNotes: UITextView!
    @IBOutlet weak var getRating: UITextField!
    @IBOutlet weak var getIngredients: UITextView!
    
    weak var delegate: ClassAddDrinkDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveDrink(_ sender: UIButton) {
        let name : String = getName.text!
        let ingredients : String = getIngredients.text!
        let rating : String = getRating.text!
       // let notes : String = getNotes.text!
       // let location : String = getLocation.text!
        delegate?.addInformation(name1: name, ingr1: ingredients, rate1: rating)
    }
    
    
}
