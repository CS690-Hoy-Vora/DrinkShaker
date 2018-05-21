// Model file, in order to create a Drink object in the realm database
// Drink database is populated by the following variables

import Foundation
import RealmSwift

class Drinks : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var ingredients : String = ""
    @objc dynamic var rating : Int = 0
    @objc dynamic var location : String = ""
    @objc dynamic var notes : String = ""
    @objc dynamic var liquorType : String = ""
    @objc dynamic var photo : String = ""
    
}

