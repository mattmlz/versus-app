//
//  Tournament.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Tournament : NSObject{
    var gains : [integer_t] = []
    var nom : String = ""
    var gagnants : [Player] = []
    
    init(gains: [integer_t], nom: String){
        self.gains = gains
        self.nom = nom
    }
    
    func ajouterGagants(gagnants: [Player]) -> Void {
        self.gagnants = gagnants
    }
    
}
