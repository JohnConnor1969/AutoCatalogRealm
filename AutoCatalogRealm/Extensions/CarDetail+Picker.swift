//
//  CarDetail+Picker.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 17.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension CarDetailTableViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func addPicker(_ textField: UITextField) {
        createYearsInterval()
        
        let yearsPicker = UIPickerView()
        yearsPicker.delegate = self
        
        textField.inputView = yearsPicker
        
        addToolBar(textField)
    }
    
    func addToolBar(_ textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(self.hideKeyboard))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)

        toolbar.setItems([flexBarButton, doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolbar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearInterval.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return yearInterval[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        yearTextField.text = yearInterval[row]
        updateSaveButtonState()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
                
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        pickerViewLabel.text = yearInterval[row]
        
        return pickerViewLabel
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func createYearsInterval() {
           let currentYear = Calendar.current.component(.year, from: Date())
           
           for year in 1900...currentYear {
               yearInterval.append(String(year))
           }
           
           yearInterval.reverse()
       }
}
