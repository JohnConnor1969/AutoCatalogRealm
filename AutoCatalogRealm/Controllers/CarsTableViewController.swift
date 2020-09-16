//
//  CarsTableViewController.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 16.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var cars = Car.getCars()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarsTableViewCell
        
        let car = cars[indexPath.row]
        cell.confugure(car: car)

        return cell
    }

    
    // MARK: - Navigation

    @IBAction func  unwindSegue(segue: UIStoryboardSegue) {
        guard let carDetailVC = segue.source as? CarDetailTableViewController else { return }
        carDetailVC.saveNewPlace()
        cars.append(carDetailVC.newCar!)
        tableView.reloadData()
    }

}
