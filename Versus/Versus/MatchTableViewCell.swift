//
//  MatchTableViewCell.swift
//  Versus
//
//  Created by Thomas Raineau on 28/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var player1Button: UIButton!
    @IBOutlet weak var player2Button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
