//
//  CategoryViewCell.swift
//  DrinkShakerProject
//
//  Created by Lina Del Bondio on 5/15/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

import UIKit

class categoryViewCell: UITableViewCell {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catDrinkRecipe: UILabel!
    @IBOutlet weak var catDrinkName: UILabel!
    @IBOutlet weak var catDrinkRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
