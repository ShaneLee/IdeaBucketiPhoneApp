//
//  Idea.swift
//  IdeaBucket
//
//  Created by Shane Lee on 02/11/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import Foundation

class Idea {
    var idea: String
    var category: String
    
    init?(idea: String, category: String) {
        if idea.isEmpty || category.isEmpty {
            return nil
        }
        self.idea = idea
        self.category = category
    }
}
