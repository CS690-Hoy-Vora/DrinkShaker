
import UIKit
import RealmSwift

class DrinkInfoController: UIViewController {
    
    @IBOutlet weak var drinkInfoName: UILabel!
    @IBOutlet weak var drinkInfoPhoto: UIImageView!
    @IBOutlet weak var infoRating: UILabel!
    @IBOutlet weak var infoLocation: UILabel!
    @IBOutlet weak var infoNotes: UILabel!
    @IBOutlet weak var infoRecipe: UILabel!
    
    var indexPath : Int = 0
    
    let realm = try! Realm()
    
    var drinkItems: Results<Drinks>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 178/255, green: 178/255, blue: 122/255, alpha: 1)
    
        loadDrink()
    }
    
    func loadDrink() {
        drinkItems = realm.objects(Drinks.self)
        drinkInfoName.text = drinkItems![indexPath].name
        infoNotes.text = drinkItems![indexPath].notes
        infoRating.text = String(drinkItems![indexPath].rating)
        infoRecipe.text = drinkItems![indexPath].ingredients
        infoLocation.text = drinkItems![indexPath].location
    }
}
