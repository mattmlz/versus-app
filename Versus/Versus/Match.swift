//
//  Match.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Match : NSObject{
    /* gagnant : L'equipe gagnante
    *  rang : Le rang du match (8 = huitieme de finale etc...)
     * aEteJoue : Si le match est terminé
    */
    //var gagnant : Team
    var rang : integer_t = 0
    var aEteJoue : Bool = false
    
    init(rang: integer_t){
        self.rang = rang
    }
    
    func jouerMatch(gagnant: Team){
        self.aEteJoue = true
    }
    
}
