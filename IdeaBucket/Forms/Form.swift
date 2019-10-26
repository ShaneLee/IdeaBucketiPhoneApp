//
//  Form.swift
//  IdeaBucket
//
//  Created by Shane Lee on 20/10/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import Foundation

class Form: NSObject {
    // This allows us to have configure the form to have N number of controls.
    @IBOutlet var controls: [FormControl]?
    
    // This allows to get values from the form controls.
    subscript(_ key: String) -> String? {
        return value(for: key)
    }
    
    func value(for key: String) -> String? {
        return controls?.first(where: { $0.key == key })?.text
    }
    
    func clear() {
        controls?.forEach { $0.clear() }
    }
}
