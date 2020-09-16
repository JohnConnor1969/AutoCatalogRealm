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
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    
    func confugure(car: Car) {
        brandModelLabel.text = "\(car.brand) \(car.model)"
        bodyYearLabel.text = "\(car.body) \(car.year)"
    }

}
