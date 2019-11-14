//
//  BindingTextField.swift
//  CollectionViewTest
//
//  Created by DAS-DEV on 14/11/19.
//  Copyright © 2019 DAS-DEV. All rights reserved.
//

import UIKit

class BindingTextField : UITextField {
    
    var textChanged :(String) -> () = { _ in }
    
    func bind(callback :@escaping (String) -> ()) {
        
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        
        self.textChanged(textField.text!)
    }
    
}
