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
    var pointsTournament : [String : Int] = [:]
    var totalPoints : Int = 0
    var tournamentsWon : Int = 0
    
    init(pseudo: String){
        super.init()
        self.pseudo = pseudo
    }
    
    func winAMatch(_ tournament: Tournament){
        // If the player already has point for this tournament
        /*if let hasPointForTournament = self.pointsTournament[tournament.name]{
            self.pointsTournament[tournament.name] += 1
        }else{
            self.pointsTournament[tournament.name] = 1
        }*/
        
        self.totalPoints += 1
    }
}
