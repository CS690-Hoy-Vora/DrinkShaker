//
//  customCellForCategories.swift
//  DrinkShakerProject
//
//  Created by Rushabh Vora on 5/21/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

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
