//
//  FormControl.swift
//  IdeaBucket
//
//  Created by Shane Lee on 20/10/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import Foundation

@objc protocol FormControl {
    // The Key identifies the control
    var key: String? { get }
    // the text is the value from the input. 
    var text: String? { get }
    
    func clear()
}
