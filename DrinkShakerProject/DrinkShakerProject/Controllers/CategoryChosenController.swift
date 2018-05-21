// Lists all the drinks depending on liquor type chosen

import UIKit
import RealmSwift

class CategoryChosenController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var drinkItems: Results<Drinks>?
    
    @IBOutlet weak var tableView2: UITableView!
    let realm = try! Realm()
    var liquorType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView2.rowHeight = 200
        loadDrinks()
        NotificationCenter.default.addObserver(self, selector: #selector(loadDrinks), name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkItems?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDrinkInfoFromCategory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DrinkInfoController
        destinationVC.possibleLiquorType = liquorType!
        destinationVC.indexPath = Int(tableView2.indexPathForSelectedRow!.row)
    }
    
    @objc func loadDrinks() {
        drinkItems = realm.objects(Drinks.self).filter("liquorType = '\(liquorType!)'")
        self.tableView2.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "catgoryDrinks", for: indexPath) as! customCellForCategories
        
        cell.drinkName?.text = drinkItems?[indexPath.row].name ?? "No Drinks in Recipe Book"
        cell.drinkRecipe?.text = drinkItems?[indexPath.row].ingredients
        cell.drinkRating?.text = "\(drinkItems![indexPath.row].rating)/5"
        cell.drinkImage?.image = getImage(index: indexPath.row)
        
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
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

