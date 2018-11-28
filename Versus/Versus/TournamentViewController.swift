//
//  TournamentViewController.swift
//  Versus
//
//  Created by Thomas Raineau on 26/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit
//import SwiftyJSON

class TournamentViewController: UIViewController {
    
    var tournament: Tournament!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index,match) in tournament.matchs.enumerated(){
            // First round
            if(match.rank == 1){
                let player1 = UIButton(frame: CGRect(x: 100, y: 300 + (250 * index), width: 150, height: 40))
                player1.center.x = self.view.center.x
                player1.backgroundColor = .white
                player1.setTitle(match.playerOne.pseudo , for: .normal)
                player1.titleLabel?.font =  UIFont(name: "PermanentMarker", size: 20)
                player1.setTitleColor(UIColor.black, for: UIControl.State.normal)
                player1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                
                let label = UILabel(frame: CGRect(x: 100, y: 350 + (250 * index), width: 50, height: 30))
                label.center.x = self.view.center.x
                label.textAlignment = .center
                label.text = "VS"
                label.font =  UIFont(name: "PermanentMarker", size: 30)
                self.view.addSubview(label)
                
                let player2 = UIButton(frame: CGRect(x: 100, y: 400 + (250 * index), width: 150, height: 40))
                player2.center.x = self.view.center.x
                player2.backgroundColor = .white
                player2.setTitle(match.playerTwo.pseudo , for: .normal)
                player2.titleLabel?.font =  UIFont(name: "PermanentMarker", size: 20)
                player2.setTitleColor(UIColor.black, for: UIControl.State.normal)
                player2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                
                self.view.addSubview(player1)
                self.view.addSubview(player2)
            }
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
}
