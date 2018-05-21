
import UIKit
import RealmSwift

class AddDrinkController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate{
    
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getLocation: UITextField!
    @IBOutlet weak var getNotes: UITextView!
    @IBOutlet weak var getRating: UITextField!
    @IBOutlet weak var getIngredients: UITextView!
    @IBOutlet weak var getPhoto: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView()
        getNotes.delegate = self
        getIngredients.delegate = self
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        getPhoto.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addPhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
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
                var newDrink = Drinks()
                newDrink.name = getName.text!
                newDrink.location = getLocation.text!
                newDrink.ingredients = getIngredients.text!
                newDrink.notes = getNotes.text!
                realm.add(newDrink)
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
