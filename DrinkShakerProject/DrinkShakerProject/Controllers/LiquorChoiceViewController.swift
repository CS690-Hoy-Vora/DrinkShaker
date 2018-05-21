
import UIKit

protocol SendLiquorTypeDelegate {
    func liquorTypeChosen (liquorType: String)
}

class LiquorChoiceViewController: UIViewController {
    
    var delegate : SendLiquorTypeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func vodkaChoice(_ sender: Any) {
        delegate?.liquorTypeChosen(liquorType: "Vodka")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tequilaChoice(_ sender: Any) {
        delegate?.liquorTypeChosen(liquorType: "Tequila")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rumChoice(_ sender: Any) {
        delegate?.liquorTypeChosen(liquorType: "Rum")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func whiskeyChoice(_ sender: Any) {
        delegate?.liquorTypeChosen(liquorType: "Whiskey")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ginChoice(_ sender: Any) {
        delegate?.liquorTypeChosen(liquorType: "Gin")
        dismiss(animated: true, completion: nil)
    }
}
