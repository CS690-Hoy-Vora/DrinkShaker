// Cell for the table view in the Category Chosen Controller and view

import UIKit

class customCellForCategories: UITableViewCell {
    
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkRating: UILabel!
    @IBOutlet weak var drinkRecipe: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
