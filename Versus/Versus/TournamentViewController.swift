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
                let button = UIButton(frame: CGRect(x: 100, y: 300 + 100 * index, width: 100, height: 50))
                button.backgroundColor = .red
                button.setTitle(match.playerOne.pseudo , for: .normal)
                button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                
                self.view.addSubview(button)
            }
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
}
