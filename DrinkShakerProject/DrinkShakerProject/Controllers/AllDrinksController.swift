
import UIKit
import RealmSwift

class AllDrinksController: UITableViewController {
    
    var drinkItems: Results<Drinks>?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        self.view.backgroundColor = UIColor.darkGray
        loadDrinks()
        NotificationCenter.default.addObserver(self, selector: #selector(loadDrinks), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDrinkInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DrinkInfoController
        if segue.identifier == "toDrinkInfo" {
            destinationVC.indexPath = Int(tableView.indexPathForSelectedRow!.row)
        }
        else if segue.identifier == "toDrinkInfoRandom" {
            destinationVC.indexPath = Int(arc4random_uniform(UInt32(drinkItems!.count)))
        }
    }

    
    @objc func loadDrinks() {
        drinkItems = realm.objects(Drinks.self)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! customCell

        cell.drinkName?.text = drinkItems?[indexPath.row].name ?? "No Drinks in Recipe Book"
        cell.ingredients?.text = drinkItems?[indexPath.row].ingredients
        cell.rating?.text = "Rating: \(drinkItems![indexPath.row].rating)/5"
        cell.photo?.image = getImage(index: indexPath.row)

        return cell
    }
    
    func getImage(index : Int) -> UIImage {
        let fileManager = FileManager.default
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let imagePath = "\(documentsDirectory)/\(drinkItems![index].photo)"
        if fileManager.fileExists(atPath: imagePath) && drinkItems![index].photo != ""{
            return UIImage(contentsOfFile: imagePath)!
        }
        else{
            return #imageLiteral(resourceName: "manhattan")
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        performSegue(withIdentifier: "toDrinkInfoRandom", sender: self)
        
    }
}
