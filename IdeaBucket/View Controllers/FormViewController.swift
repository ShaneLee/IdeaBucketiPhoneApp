//
//  FormViewController.swift
//  IdeaBucket
//
//  Created by Shane Lee on 20/10/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import UIKit

final class IdeaFormController: UIViewController {
    @IBOutlet var form: Form!
    
    
    @IBAction func submit() {
        print("Form Data:",
          form["idea"] as Any,
          form["category"] as Any)
        postIdea(idea: form["idea"]!, category: form["category"]!)
    }
}
