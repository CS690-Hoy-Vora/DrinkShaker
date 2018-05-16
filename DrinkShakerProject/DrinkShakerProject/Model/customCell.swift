//
//  customCell.swift
//  DrinkShakerProject
//
//  Created by Lina Del Bondio on 5/15/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

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
