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
    
    /*
    func saveCars() {
        
        let newCar1 = Car()
        newCar1.brand = "Kia"
        newCar1.model = "Rio"
        newCar1.body = "Sedan"
        newCar1.year = "2015"
        StorageManager.saveObject(newCar1)
        
        let newCar2 = Car()
        newCar2.brand = "Toyota"
        newCar2.model = "Avensis"
        newCar2.body = "Sedan"
        newCar2.year = "2007"
        StorageManager.saveObject(newCar2)

        let newCar3 = Car()
        newCar3.brand = "Hyundai"
        newCar3.model = "Santa Fe"
        newCar3.body = "SUV"
        newCar3.year = "2010"
        StorageManager.saveObject(newCar3)
    }
 */
}
