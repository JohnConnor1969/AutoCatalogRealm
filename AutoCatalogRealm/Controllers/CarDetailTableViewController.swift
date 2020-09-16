//
//  CarDetailTableViewController.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 16.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class CarDetailTableViewController: UITableViewController {
    
    // MARK: - Property
    
    var curentCar: Car?
    var yearInterval: [String] = []
    

    // MARK: - Outlets
    
    @IBOutlet var brandTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var bodyTextField: UITextField!
    @IBOutlet var yearTextField: UITextField!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        updateSaveButtonState()
        
        choiceInterval(yearTextField)
        addToolBar(yearTextField)
        //addDoneButton(yearTextField)
        
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
    
    // MARK: - Actions
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Functions
    
    private func setupUI() {
        if curentCar != nil {
            brandTextField.text = curentCar?.brand
            modelTextField.text = curentCar?.model
            bodyTextField.text = curentCar?.body
            yearTextField.text = curentCar?.year
        }
    }
    
    func updateSaveButtonState() {
        let brandText = brandTextField.text ?? ""
        let modelText = modelTextField.text ?? ""
        let bodyText = bodyTextField.text ?? ""
        let yearText = yearTextField.text ?? ""
        
        saveButton.isEnabled = !brandText.isEmpty && !modelText.isEmpty && !bodyText.isEmpty && !yearText.isEmpty
    }
    
    func saveCar() {
        let newCar = Car(brand: brandTextField.text!,
                         model: modelTextField.text!,
                         body: bodyTextField.text!,
                         year: yearTextField.text!)
        if curentCar != nil {
            try! realm.write {
                curentCar?.brand = newCar.brand
                curentCar?.model = newCar.model
                curentCar?.body = newCar.body
                curentCar?.year = newCar.year
            }
        } else {
            StorageManager.saveObject(newCar)
        }
    }
}

// MARK: - Text field delegaete



// MARK: - DatePicker



