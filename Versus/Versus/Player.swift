	//
//  Player.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Player : NSObject{
    var pseudo : String = ""
    var pointsTournament : integer_t = 0
    var totalPoints : integer_t = 0
    
    init(pseudo: String){
        self.pseudo = pseudo
    }
}
