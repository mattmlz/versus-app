//
//  Tournament.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Tournament : NSObject{
    var players : [Player] = []
    var matchs : [Match] = []
    var name : String = ""
    var winner : Player!
    
    init(name: String, numberOfMatch: Int, players: [Player]){
        super.init()
        self.name = name
        self.players = players
        
        createMatchs(players.count, players)
    }
    
    func createMatchs(_ numberOfPlayers : Int,_ thePlayers : [Player]){
        if(numberOfPlayers == 4){
            let match3 = Match(rank: 2,tournament: self)
            let match2 = Match(rank:1, tournament: self, nextMatch: match3, playerOne : thePlayers[2], playerTwo : thePlayers[3])
            let match1 = Match(rank:1, tournament: self, nextMatch: match3, playerOne : thePlayers[0], playerTwo : thePlayers[1])
            
            matchs.append(match1)
            matchs.append(match2)
            matchs.append(match3)
        }
    }
    
    func addWinner(_ winner: Player){
        self.winner = winner
    }
    
}
