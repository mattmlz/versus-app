//
//  TournamentViewController.swift
//  Versus
//
//  Created by Thomas Raineau on 26/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit
import SwiftyJSON

class TournamentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tournament: Tournament!
    var matchs = [Match]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        for match in tournament.matchs{
            if(match.rank == 1){
                self.matchs.append(match)
            }
        }
        self.tableView.separatorColor = self.tableView.backgroundColor
        self.tableView.reloadData()
    }
    
    //delegate tableview
    //cb d'elements dans la liste?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchs.count
    }
    
    //design de la ligne ?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cellule prototype depuis le storyboard + réutilisation de cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchTableViewCell
        
        let match = matchs[indexPath.row]
        
        //indexPath.row -> la ligne
        cell.player1Button.setTitle(match.playerOne.pseudo, for: UIControl.State.normal)
        cell.player2Button.setTitle(match.playerTwo.pseudo, for: UIControl.State.normal)
        
        cell.player1Button.tag = indexPath.row;
        cell.player2Button.tag = indexPath.row;
        
        return cell
    }
    
    //hauteur de ligne ?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    //selection de ligne
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {       
        
    }
    
    @IBAction func player1ButtonClick(_ sender: UIButton) {
        let indexPath = NSIndexPath(row: sender.tag, section: 0)
        let cell = self.tableView.cellForRow(at: indexPath as IndexPath) as! MatchTableViewCell
        cell.player1Button.titleLabel?.textColor = UIColor.green
        cell.player2Button.titleLabel?.textColor = UIColor.red
        cell.winnerLabel.text = cell.player1Button.titleLabel?.text
        
        let match = matchs[indexPath.row]
        match.nextMatch?.addPlayer(match.playerOne)
        match.played = true
    }
    
    @IBAction func player2ButtonClick(_ sender: UIButton) {
        let indexPath = NSIndexPath(row: sender.tag, section: 0)
        let cell = self.tableView.cellForRow(at: indexPath as IndexPath) as! MatchTableViewCell
        cell.player1Button.titleLabel?.textColor = UIColor.red
        cell.player2Button.titleLabel?.textColor = UIColor.green
        cell.winnerLabel.text = cell.player2Button.titleLabel?.text
        
        let match = matchs[indexPath.row]
        match.nextMatch?.addPlayer(match.playerTwo)
        match.played = true
    }
}
