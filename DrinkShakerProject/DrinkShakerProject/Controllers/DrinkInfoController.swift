
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
    
        loadDrink()
    }
    
    func loadDrink() {
        drinkItems = realm.objects(Drinks.self)
        drinkInfoName.text = "Drink Name:\n\(drinkItems![indexPath].name)"
        infoNotes.text = "Notes:\n\(drinkItems![indexPath].notes)"
        infoRating.text = "Rating: \(String(drinkItems![indexPath].rating))/5"
        infoRecipe.text = "Ingredients:\n\(drinkItems![indexPath].ingredients)"
        infoLocation.text = "Place to buy: \(drinkItems![indexPath].location)"
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
