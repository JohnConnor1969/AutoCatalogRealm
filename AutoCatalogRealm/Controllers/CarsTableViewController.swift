//
//  CarsTableViewController.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 16.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit
import RealmSwift

class CarsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var cars: Results<Car>!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars = realm.objects(Car.self)
        
        setupUI()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.isEmpty ? 0 : cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarsTableViewCell
        
        let car = cars[indexPath.row]
        cell.confugure(car: car)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let car = cars[indexPath.row]
            StorageManager.deleteObject(car)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let car = cars[indexPath.row]
            let navigationVC = segue.destination as! UINavigationController
            let carDetalVC = navigationVC.topViewController as! CarDetailTableViewController
            carDetalVC.curentCar = car
        }
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let carDetailVC = segue.source as? CarDetailTableViewController else { return }
        carDetailVC.saveCar()
        tableView.reloadData()
    }
    
    // MARK: - Functions
    
    private func setupUI() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.title = "Cars"
    }
}
