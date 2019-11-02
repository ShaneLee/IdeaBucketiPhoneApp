//
//  IdeaTableViewCell.swift
//  IdeaBucket
//
//  Created by Shane Lee on 02/11/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import UIKit

class IdeaTableViewCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var ideaLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
