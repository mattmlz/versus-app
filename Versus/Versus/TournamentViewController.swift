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
    var matchs: Match = [Match]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for match in tournament.matchs{
            self.matchs = match
            self.tableView.reloadData()
        }
    }
    
    //delegate tableview
    //cb d'elements dans la liste?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tournament.matchs.count
    }
    
    //design de la ligne ?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cellule prototype depuis le storyboard + réutilisation de cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        
        //indexPath.row -> la ligne
        cell.titleLabel.text = movie.title
        cell.dateLabel.text = "DATE: \(movie.releaseDate)"
        
        return cell
    }
    
    //hauteur de ligne ?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    //selection de ligne
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = movies[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailViewController.movie = movie
        
        //PUSH
        navigationController?.pushViewController(detailViewController, animated: true)
        
        
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }



/*for (index,match) in tournament.matchs.enumerated(){
 // First round
 if(match.rank == 1){
 let player1 = UIButton(frame: CGRect(x: 100, y: 200 + (200 * index), width: 150, height: 40))
 player1.center.x = self.view.center.x
 player1.backgroundColor = .white
 player1.setTitle(match.playerOne.pseudo , for: .normal)
 player1.titleLabel?.font =  UIFont(name: "PermanentMarker", size: 20)
 player1.setTitleColor(UIColor.black, for: UIControl.State.normal)
 player1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
 
 let label = UILabel(frame: CGRect(x: 100, y: 265 + (200 * index), width: 50, height: 30))
 label.center.x = self.view.center.x
 label.textAlignment = .center
 label.text = "VS"
 label.font =  UIFont(name: "PermanentMarker", size: 30)
 self.view.addSubview(label)
 
 let player2 = UIButton(frame: CGRect(x: 100, y: 300 + (200 * index), width: 150, height: 40))
 player2.center.x = self.view.center.x
 player2.backgroundColor = .white
 player2.setTitle(match.playerTwo.pseudo , for: .normal)
 player2.titleLabel?.font =  UIFont(name: "PermanentMarker", size: 20)
 player2.setTitleColor(UIColor.black, for: UIControl.State.normal)
 player2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
 
 self.view.addSubview(player1)
 self.view.addSubview(player2)
 }*/
    
}
