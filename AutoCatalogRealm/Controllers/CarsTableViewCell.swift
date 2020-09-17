//
//  CarsTableViewCell.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 16.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var brandModelLabel: UILabel!
    @IBOutlet var bodyYearLabel: UILabel!
    
    // MARK: - Functions
    
    func confugure(car: Car) {
        brandModelLabel.text = "\(car.brand) \(car.model)"
        bodyYearLabel.text = "\(car.body) \(car.year)"
    }
}
