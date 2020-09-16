//
//  Car.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 16.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation
import RealmSwift

class Car: Object {
    @objc dynamic var brand = ""
    @objc dynamic var model = ""
    @objc dynamic var body = ""
    @objc dynamic var year = ""
    
    convenience init(brand: String, model: String, body: String, year: String) {
        self.init()
        self.brand = brand
        self.model = model
        self.body = body
        self.year = year
    }
}
