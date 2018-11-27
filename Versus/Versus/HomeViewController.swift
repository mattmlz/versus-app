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
    
    let playerPicker =  UIPickerView()
    let allPlayersTextField: [UITextField] = []
    let possiblePlayersNumbers: [String] = ["4","8"]
    let playersPseudo: [String] = ["Peter", "Jane", "Paul", "Mary", "Kevin", "Lucy"]
    var selectedTextField: UITextField = UITextField()
    var thePlayers : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get all the players pseudo stored
        /*let path = Bundle.main.path(forResource: "players", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                print("jsonData:\(jsonObj)")
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        
        for (index,subJson):(String, JSON) in json {
            // Do something you want
        }*/
        
        // All our players textFields
        let allPlayersTextField: [UITextField] = [player1,player2,player3,player4,player5,player6,player7,player8]
        
        playerPicker.delegate = self
        
        // Picker view for all our players textField
        for playerTextField in allPlayersTextField{
            playerTextField.inputView = playerPicker
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.selectedTextField = textField
    }
    
    // Picker view methods
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
        print(playersPseudo[row] + "\n")
        print(selectedTextField)
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
        
/*
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let tournamentViewController = storyboard.instantiateViewController(withIdentifier: "PlayersViewController") as! TournamentViewController
        
        //PUSH
        navigationController?.pushViewController(tournamentViewController, animated: true)
         
         tournamentViewController.tournament = theTournament
 */
        
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
