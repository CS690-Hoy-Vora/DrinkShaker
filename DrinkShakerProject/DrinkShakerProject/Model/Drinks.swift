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
    @objc dynamic var liquorType : String = ""
    //@objc dynamic var photo : String = ""
 
}

