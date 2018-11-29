//
//  Tournament.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Tournament : NSObject{
    var currentRank : Int = 0
    var players : [Player] = []
    var matchs : [Match] = []
    var name : String = ""
    var winner : Player!
    
    init(name: String, players: [Player]){
        super.init()
        self.name = name
        self.players = players
        self.currentRank = 1
        
        createMatchs(players.count, players)
    }
    
    func createMatchs(_ numberOfPlayers : Int,_ thePlayers : [Player]){
        if(numberOfPlayers == 4){
            let match3 = Match(number: 3,rank: 2,tournament: self)
            let match2 = Match(number: 2,rank:1, tournament: self, nextMatch: match3, playerOne : thePlayers[2], playerTwo : thePlayers[3])
            let match1 = Match(number: 1,rank:1, tournament: self, nextMatch: match3, playerOne : thePlayers[0], playerTwo : thePlayers[1])
            
            matchs.append(match1)
            matchs.append(match2)
            matchs.append(match3)
        }else if(numberOfPlayers == 8){
            let match7 = Match(number: 7,rank: 3,tournament: self)
            let match6 = Match(number: 6,rank: 2,tournament: self)
            let match5 = Match(number: 5,rank: 2,tournament: self)
            let match4 = Match(number: 4,rank:1, tournament: self, nextMatch: match6, playerOne : thePlayers[6], playerTwo : thePlayers[7])
            let match3 = Match(number: 3,rank:1, tournament: self, nextMatch: match6, playerOne : thePlayers[4], playerTwo : thePlayers[5])
            let match2 = Match(number: 2,rank:1, tournament: self, nextMatch: match5, playerOne : thePlayers[2], playerTwo : thePlayers[3])
            let match1 = Match(number: 1,rank:1, tournament: self, nextMatch: match5, playerOne : thePlayers[0], playerTwo : thePlayers[1])
            
            matchs.append(match1)
            matchs.append(match2)
            matchs.append(match3)
            matchs.append(match4)
            matchs.append(match5)
            matchs.append(match6)
            matchs.append(match7)
        }
    }
    
    func addWinner(_ winner: Player){
        self.winner = winner
    }
    
    func printTournamentInfos(){
        print("Tournoi nommé " + self.name + "\n")
        for match in self.matchs{
            match.printMatchInfos()
        }
    }
    
}
