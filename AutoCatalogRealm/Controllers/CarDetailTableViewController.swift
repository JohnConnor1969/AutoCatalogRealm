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
        
        addDoneButton(yearTextField)
        
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
    
    private func updateSaveButtonState() {
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

extension CarDetailTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case brandTextField:
            textField.resignFirstResponder()
            modelTextField.becomeFirstResponder()
        case modelTextField:
            textField.resignFirstResponder()
            bodyTextField.becomeFirstResponder()
        case bodyTextField:
            textField.resignFirstResponder()
            yearTextField.becomeFirstResponder()
        case yearTextField:
            view.endEditing(true)
        default:
            break
        }
        
        return true
    }
    
    func addDoneButton(_ textField: UITextField) {
        let keyboardToolBar = UIToolbar()
        textField.inputAccessoryView = keyboardToolBar
        keyboardToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        keyboardToolBar.items = [flexBarButton, doneButton]
        
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}
