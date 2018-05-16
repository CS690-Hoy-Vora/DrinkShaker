//
//  DrinkData.swift
//  DrinkShakerProject
//
//  Created by Rushabh Vora on 5/15/18.
//  Copyright © 2018 Shayn. All rights reserved.
//

import Foundation
import RealmSwift

class Drinks : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var ingredients : String = ""
    @objc dynamic var rating : Int = 0
    @objc dynamic var location : String = ""
    @objc dynamic var notes : String = ""
    @objc dynamic var photo : String = ""
    
    init(name : String, ingredients : String, rating : Int, location : String, notes : String, photo : String )
    {
        self.name = name
        self.ingredients = ingredients
        
        if rating > 5 {
            self.rating = 5
        }
        else if rating < 0
        {
            self.rating = 0
        }
        else
        {
            self.rating = rating
        }
        
        self.location = location
        
        self.notes = notes
        
        self.photo = photo
    }
    
}
