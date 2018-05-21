// Cell for table view in the All Drinks Controller class and view

import UIKit

class customCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
