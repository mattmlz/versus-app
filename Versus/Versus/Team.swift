//
//  Equipe.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Team : NSObject{
    var nom: String = ""
    var joueurs: [Player] = []
    
    init(nom: String){
        self.nom = nom
    }    
}
