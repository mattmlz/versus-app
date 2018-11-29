//
//  Match.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Match : NSObject{
    /* winner : The winning team
    *  rank : The match rank (1 = first round etc...)
    * played : If the match was already played
     * playerOne : The first contestant
     * playerTwo : The second contestant
     * number : The position of the match
     * nextMatch : The next match in the bracket
     * tournament : The tournament's id
    */
    var winner : Player!
    var nextMatch : Match?
    var tournament : Tournament!
    var rank : Int = 0
    var playerOne : Player!
    var playerTwo : Player!
    var played : Bool = false
    var number : Int = 0
    
    // Basic constructor
    init(number: Int,rank: Int, tournament: Tournament){
        super.init()
        self.number = number
        self.rank = rank
        self.tournament = tournament
    }
    
    // Constructor with the two players
    init(number: Int,rank: Int, tournament: Tournament, playerOne: Player, playerTwo : Player){
        super.init()
        self.number = number
        self.rank = rank
        self.tournament = tournament
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    // Constructor with the next match
    init(number: Int,rank: Int, tournament: Tournament, nextMatch: Match){
        super.init()
        self.number = number
        self.rank = rank
        self.tournament = tournament
        self.nextMatch = nextMatch
    }
    
    // Constructor with the next match and the two players
    init(number: Int,rank: Int, tournament: Tournament, nextMatch : Match, playerOne: Player, playerTwo : Player){
        super.init()
        self.number = number
        self.rank = rank
        self.tournament = tournament
        self.nextMatch = nextMatch
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    func playMatch(_ winner: Player){
        self.winner = winner
        self.played = true
        
        // Add one point to the winner
        winner.winAMatch(tournament)
        
        // If there's a next match, the tournament keep going
        if((self.nextMatch) != nil){
            self.nextMatch!.addPlayer(winner)
        }else{
        // If not, it was the final match
            self.tournament.addWinner(winner)
        }
    }
    
    func addPlayer(_ player: Player){
        if(self.playerOne == nil){
            self.playerOne = player
        }else if(self.playerTwo == nil){
            self.playerTwo = player
        }
    }
    
    func printMatchInfos(){
        if(self.playerOne != nil && self.playerTwo != nil){
            print("Match numéro " + String(self.number) + "\n")
            print("opposant " + self.playerOne.pseudo)
            print(" à " + self.playerTwo.pseudo + "\n")
            print("et qui se déroule pendant la " + String(self.rank) + " phase" + "\n")
        }else{
            print("Match numéro " + String(self.number) + "\n")
            print("et qui se déroule pendant la " + String(self.rank) + " phase" + "\n")
        }
    }
    
}
