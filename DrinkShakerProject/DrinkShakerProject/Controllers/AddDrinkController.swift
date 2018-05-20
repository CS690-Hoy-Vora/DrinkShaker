
import UIKit
import RealmSwift

class AddDrinkController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate{
    
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getLocation: UITextField!
    @IBOutlet weak var getNotes: UITextView!
    @IBOutlet weak var getRating: UITextField!
    @IBOutlet weak var getIngredients: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var getPhoto: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNotes.delegate = self
        getIngredients.delegate = self
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        getPhoto.image = chosenImage
        imageLabel.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    var text = ""
    @IBAction func getValues ()
    {
        text = getName.text!
    }
    
    let realm = try! Realm()
    
    
   // let drink = Drinks()
}
