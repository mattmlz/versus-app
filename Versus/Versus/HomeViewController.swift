//
//  HomeViewController.swift
//  Versus
//
//  Created by Thomas Raineau on 24/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tournamentTextField: UITextField!
    
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBOutlet weak var player3: UITextField!
    @IBOutlet weak var player4: UITextField!
    @IBOutlet weak var player5: UITextField!
    @IBOutlet weak var player6: UITextField!
    @IBOutlet weak var player7: UITextField!
    @IBOutlet weak var player8: UITextField!
    @IBOutlet weak var playerNumber: UITextField!
    
    let playerPicker =  UIPickerView()
    var allPlayersTextField: [UITextField] = []
    let possiblePlayersNumbers: [String] = ["4","8"]
    let playersPseudo: [String] = ["Peter", "Jane", "Paul", "Mary", "Kevin", "Lucy"]
    var selectedTextField: UITextField = UITextField()
    var thePlayers : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allPlayersTextField = [player1,player2,player3,player4,player5,player6,player7,player8]
        
        playerPicker.delegate = self
        
        //gameTextField.delegate = self
        
        // Picker view for all our players textField
        for playerTextField in allPlayersTextField{
            playerTextField.inputView = playerPicker
        }
        
        //allow tap on screen to remove text field input from screen
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    // Picker View methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.selectedTextField = textField
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playersPseudo.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return playersPseudo[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        view.selectedTextField?.text = playersPseudo[row]
        self.view.endEditing(true)
    }
    
    @IBAction func letsRumbleClick(_ sender: UIButton) {
        for playerTextField in allPlayersTextField{
            if(playerTextField.text != ""){
                thePlayers.append(Player(pseudo: playerTextField.text!))
            }
        }
        
        let theTournament = Tournament(name: tournamentTextField.text!, players: thePlayers)
        theTournament.printTournamentInfos()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tournamentViewController = storyboard.instantiateViewController(withIdentifier: "TournamentViewController") as! TournamentViewController
        
        //PUSH
        navigationController?.pushViewController(tournamentViewController, animated: true)
         
        tournamentViewController.tournament = theTournament        
    }
    
    @IBAction func addPlayersClick(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let playersViewController = storyboard.instantiateViewController(withIdentifier: "PlayersViewController") as! PlayersViewController
        
        //PUSH
        navigationController?.pushViewController(playersViewController, animated: true)
    }
}

extension UIView {
    var textFieldsInView: [UITextField] {
        return subviews
            .filter ({ !($0 is UITextField) })
            .reduce (( subviews.compactMap { $0 as? UITextField }), { summ, current in
                return summ + current.textFieldsInView
            })
    }
    var selectedTextField: UITextField? {
        return textFieldsInView.filter { $0.isFirstResponder }.first
    }
}
