
import UIKit
import RealmSwift

class AddDrinkController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate, SendLiquorTypeDelegate {
    
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getLocation: UITextField!
    @IBOutlet weak var getNotes: UITextView!
    @IBOutlet weak var getRating: UITextField!
    @IBOutlet weak var getIngredients: UITextView!
    @IBOutlet weak var getPhoto: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    let realm = try! Realm()
    var randomPath : String = ""
    var liquorTypeReceived : String = ""
    let controller = UIImagePickerController()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView()
        getNotes.delegate = self
        getIngredients.delegate = self
        controller.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        getPhoto.contentMode = .scaleAspectFit
        getPhoto.image = chosenImage
        
        let fileManager = FileManager.default
        randomPath = randomString()
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(randomPath).png")
        
        let data = UIImagePNGRepresentation(chosenImage)
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func randomString() -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< 10 {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    
    @IBAction func addPhoto(_ sender: Any) {
                controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func setLiquorBtnPushed(_ sender: Any) {
        performSegue(withIdentifier: "liquorTypeSegue", sender: nil)
    }
   
    func liquorTypeChosen(liquorType: String) {
        liquorTypeReceived = liquorType
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LiquorChoiceViewController {
            destination.delegate = self
        }
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        let controller = UIImagePickerController()
//        controller.delegate = self
//        controller.sourceType = .photoLibrary
//
//        present(controller, animated: true, completion: nil)
//    }
//
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    @IBAction func clearButton(_ sender: Any) {
        resetView()
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        do {
            try self.realm.write {
                let newDrink = Drinks()
                newDrink.name = getName.text!
                newDrink.location = getLocation.text!
                newDrink.ingredients = getIngredients.text!
                newDrink.notes = getNotes.text!
                newDrink.photo = "\(randomPath).png"
                
                if let ratingValue : Int = Int(getRating.text!) {
                
                    if ratingValue >= 0 && ratingValue <= 5 {
                        newDrink.rating = ratingValue
                    }
                }
                newDrink.liquorType = liquorTypeReceived
                
                realm.add(newDrink)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

            }
        }
        catch {
            print("Error saving new items, \(error)")
        }
        resetView()
    }
    
    
    
    //resets the view to its original state
    func resetView(){
        getName.text = "Enter Drink Name"
        getLocation.text = "Enter Where to Buy From"
        getNotes.text = "Additional Notes"
        getRating.text = "Enter a rating between 1 and 5"
        getIngredients.text = "Enter Ingredients"
        getPhoto.image = nil
    }

}
