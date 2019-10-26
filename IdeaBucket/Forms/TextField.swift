//
//  TextField.swift
//  IdeaBucket
//
//  Created by Shane Lee on 20/10/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import UIKit

@IBDesignable class TextField: UITextField {
    @IBInspectable var key: String?
}

extension TextField: FormControl {
    func clear() {
        text = nil
    }
}
