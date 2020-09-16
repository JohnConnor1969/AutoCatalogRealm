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
    
    var newCar: Car?
    
    // MARK: - Oitlets
    
    @IBOutlet var brandTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var bodyTextField: UITextField!
    @IBOutlet var yearTextField: UITextField!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButtonState()

        // Убираем лишнюю разлиновку ячеек, там где нет контента
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
    
    private func updateSaveButtonState() {
        let brandText = brandTextField.text ?? ""
        let modelText = modelTextField.text ?? ""
        let bodyText = bodyTextField.text ?? ""
        let yearText = yearTextField.text ?? ""
        
        saveButton.isEnabled = !brandText.isEmpty && !modelText.isEmpty && !bodyText.isEmpty && !yearText.isEmpty
    }
    
    func saveNewPlace() {
        newCar = Car(brand: brandTextField.text!,
                     model: modelTextField.text!,
                     body: bodyTextField.text!,
                     year: yearTextField.text!)
        
    }

}

// MARK: - Text field delegaete

extension CarDetailTableViewController: UITextFieldDelegate {
    
    // Hide keyboard to return key tap
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
