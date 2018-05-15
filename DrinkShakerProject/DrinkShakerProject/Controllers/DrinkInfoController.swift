
import UIKit

class DrinkInfoController: UIViewController {
    
    @IBOutlet weak var drinkInfoName: UILabel!
    @IBOutlet weak var drinkInfoPhoto: UIImageView!
    @IBOutlet weak var infoRating: UILabel!
    @IBOutlet weak var infoLocation: UILabel!
    @IBOutlet weak var infoNotes: UILabel!
    @IBOutlet weak var infoRecipe: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 178/255, green: 178/255, blue: 122/255, alpha: 1)
    
    }
    
    
}
