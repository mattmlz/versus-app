//
//  ViewController.swift
//  Versus
//
//  Created by Matthieu T on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var letsBegin: UIButton!
    
    let redBackground = UIColor(red:0.88, green:0.26, blue:0.17, alpha:1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = redBackground
        
        letsBegin.layer.borderWidth = 2
        letsBegin.layer.cornerRadius = 5
        letsBegin.layer.borderColor = UIColor.white.cgColor
    }

    @IBAction func letsBeginClick(_ sender: UIButton) {
        
        //afficher la home
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "NavigationController")
        
        present(homeViewController, animated: true, completion: nil)
    }
    
}

