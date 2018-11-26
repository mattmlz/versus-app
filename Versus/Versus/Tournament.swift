//
//  Tournament.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Tournament : NSObject{
    var joueurs : [Player] = []
    var gains : [integer_t] = []
    var nom : String = ""
    var gagnants : [Player] = []
    
    init(_ gains: [integer_t],_ nom: String){
        self.gains = gains
        self.nom = nom
    }
    
    func ajouterGagants(_ gagnants: [Player]) -> Void {
        self.gagnants = gagnants
    }
    
}
