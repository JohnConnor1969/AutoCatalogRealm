//
//  Cardetail+TextField.swift
//  AutoCatalogRealm
//
//  Created by Valeriy Pokatilo on 17.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

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

}
