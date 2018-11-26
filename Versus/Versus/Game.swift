//
//  Game.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Game : NSObject{
    /* nom : Le nom du jeu
     *  type : Le type de jeu
     *
     */
    var name : String = ""
    var type : String = ""
    
    init(name: String,type: String){
        super.init()
        self.name = name
        self.type = type
    }
    
}
