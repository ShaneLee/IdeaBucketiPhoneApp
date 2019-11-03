//
//  Parser.swift
//  IdeaBucket
//
//  Created by Shane Lee on 02/11/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import Foundation

func parseJSON(data: Data) -> [Idea] {
    var retVal = [Idea]()
    
    do {
        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
        if let dictionary = jsonResponse as? [String: Any] {
            if let ideas = dictionary["ideas"] as? [Any] {
                for nestedIdeaObj in ideas {
                    if let ideaObj = nestedIdeaObj as? [String: Any] {
                        var category: String?
                        
                        if (ideaObj["idea"] == nil) {
                            continue
                        }
                        let idea = ideaObj["idea"] as! String
                        category = (ideaObj["category"] as! String)
                       
                        if (ideaObj["category"] == nil) {
                            category = ""
                        }
                        print(idea)
                        print(category!)
                        
                        guard let completeIdea = Idea(idea: idea, category: category!) else {
                            continue
                        }
                        
                        retVal.append(completeIdea)
                    }
                }
            }
        }
    } catch let ParsingError {
        print("Error: ", ParsingError)
    }
    return retVal
}
