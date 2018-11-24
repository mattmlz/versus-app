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
    *  rang : Le rang du match (1 = premier round etc...)
    * aEteJoue : Si le match est terminé
     * matchPrecedent : Le match precedent
     * matchSuivant : Le match suivant
    */
    var gagnant : Team!
    var matchPrecedent : Match!
    var matchSuivant : Match!
    var rang : integer_t = 0
    var aEteJoue : Bool = false
    
    init(_ rang: integer_t){
        self.rang = rang
    }
    
    func jouerMatch(_ gagnant: Team) -> Void{
        self.gagnant = gagnant
        self.aEteJoue = true
    }
    
}
