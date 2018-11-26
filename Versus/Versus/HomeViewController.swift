//
//  HomeViewController.swift
//  Versus
//
//  Created by Thomas Raineau on 24/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var labelTournament: UILabel!
    @IBOutlet weak var textFieldTournament: UITextField!
    @IBOutlet weak var labelGame: UILabel!
    @IBOutlet weak var textFieldGame: UITextField!
    @IBOutlet weak var labelPlayers: UILabel!
    @IBOutlet weak var playersPickerView: UIPickerView!
    @IBOutlet weak var textFieldPlayers: UITextField!
    @IBOutlet weak var labelPlayerOne: UILabel!
    @IBOutlet weak var textFieldPlayerOne: UITextField!
    @IBOutlet weak var labelPlayerTwo: UILabel!
    @IBOutlet weak var textFieldPlayerTwo: UITextField!
    @IBOutlet weak var buttonLetsRumble: UIButton!
    
    let playersNumber = [1,2,3,4,5,6,7,8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func newTournament(){
        
    }
    
    
}
