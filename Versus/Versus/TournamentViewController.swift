//
//  TournamentViewController.swift
//  Versus
//
//  Created by Thomas Raineau on 26/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit
//import SwiftyJSON

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
        
        return cell
    }
    
    //hauteur de ligne ?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    //selection de ligne
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {       
        
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }    
}
