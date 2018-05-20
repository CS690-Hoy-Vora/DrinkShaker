//
//  PopupViewController.swift
//  DrinkShakerProject
//
//  Created by Lina Del Bondio on 5/20/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func AlphabeticlaClosePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func LiquorClosePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func RatingHtoLClosePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    @IBAction func RatingLtoHClosePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
}
