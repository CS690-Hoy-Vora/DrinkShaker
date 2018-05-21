// Possibly the main page of the application, this view lists all the drinks that are present in the realm database

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
        NotificationCenter.default.addObserver(self, selector: #selector(loadDrinks), name: NSNotification.Name(rawValue: "load"), object: nil) // Repopulates the table view when a drink has been added
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkItems?.count ?? 1
    }
    
    // Method to open the detailed drink page of the selected drink
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDrinkInfo", sender: self)
    }
    
    // Method to send information to the Drink Info Controller depending on segue triggered
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DrinkInfoController
        if segue.identifier == "toDrinkInfo" {
            destinationVC.indexPath = Int(tableView.indexPathForSelectedRow!.row)
        }
            // This segue is triggered when the device is shaken
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
    
    // Method to fetch the image file for each row/drink item
    func getImage(index : Int) -> UIImage {
        let fileManager = FileManager.default
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let imagePath = "\(documentsDirectory)/\(drinkItems![index].photo)"
        if fileManager.fileExists(atPath: imagePath) && drinkItems![index].photo != ""{
            return UIImage(contentsOfFile: imagePath)!
        }
        else{
            return #imageLiteral(resourceName: "manhattan") //in case no image file has been given, stock image is used
        }
    }
    
    // Method to show a random drink when phone is shaken 
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        performSegue(withIdentifier: "toDrinkInfoRandom", sender: self)
        
    }
}
