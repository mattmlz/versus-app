//
//  HomeViewController.swift
//  Versus
//
//  Created by Thomas Raineau on 24/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit
//import SwiftyJSON

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tournamentTextField: UITextField!
    
    @IBOutlet weak var textPlayer5: UILabel!
    @IBOutlet weak var textPlayer6: UILabel!
    @IBOutlet weak var textPlayer7: UILabel!
    @IBOutlet weak var textPlayer8: UILabel!
    
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
    var morePlayersTextField: [UITextField] = []
    var morePlayersLabel: [UILabel] = []
    let playersPseudo: [String] = ["Peter", "Jane", "Paul", "Mary", "Kevin", "Lucy"]
    let playersNumberAllows: [String] = ["4","8"]
    var selectedTextField: UITextField = UITextField()
    var thePlayers : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Players picker
        allPlayersTextField = [player1,player2,player3,player4,player5,player6,player7,player8]
        
        // More players field
        morePlayersTextField = [player5,player6,player7,player8]
        morePlayersLabel = [textPlayer5,textPlayer6,textPlayer7,textPlayer8]
        
        playerPicker.delegate = self
        playerNumber.delegate = self
        playerNumber.inputView = playerPicker
        
        // Picker view for all our players textField
        for playerTextField in allPlayersTextField{
            playerTextField.delegate = self
            playerTextField.inputView = playerPicker
        }
        
        //allow tap on screen to remove text field input from screen
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        // Player number field
        playerNumber.text = "4"
        
        // Hide player 5 to 8 by default
        showPlayers(4)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Picker View methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.selectedTextField = textField
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(playerNumber.isFirstResponder){
            return playersNumberAllows.count
        }else{
            return playersPseudo.count
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(playerNumber.isFirstResponder){
            return playersNumberAllows[row]
        }else{
            return playersPseudo[row]
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(playerNumber.isFirstResponder){
            view.selectedTextField?.text = playersNumberAllows[row]
            self.view.endEditing(true)
            showPlayers(Int(playersNumberAllows[row]) ?? 4)
        }else{
            view.selectedTextField?.text = playersPseudo[row]
            self.view.endEditing(true)
        }
    }
    
    func showPlayers(_ numberOfPlayers: Int){
        if(numberOfPlayers == 8){
            for morePlayerField in morePlayersTextField{
                morePlayerField.isHidden = false
            }
            for morePlayerLabel in morePlayersLabel{
                morePlayerLabel.isHidden = false
            }
        }else if(numberOfPlayers == 4){
            for morePlayerField in morePlayersTextField{
                morePlayerField.isHidden = true
            }
            for morePlayerLabel in morePlayersLabel{
                morePlayerLabel.isHidden = true
            }
        }
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
