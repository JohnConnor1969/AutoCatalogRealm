//
//  Car.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 16.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

struct Car {
    var brand: String
    var model: String
    var body: String
    var year: String

    static func getCars() -> [Car] {
        let cars = [Car(brand: "Kia", model: "Rio", body: "Sedan", year: "2015"),
                    Car(brand: "Toyota", model: "Avensis", body: "Sedan", year: "2007"),
                    Car(brand: "Huinday", model: "Santa Fe", body: "SUV", year: "2010")]
        
        return cars
    }
}
