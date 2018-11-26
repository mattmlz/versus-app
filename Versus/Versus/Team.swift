//
//  Equipe.swift
//  Versus
//
//  Created by Thomas Raineau on 23/11/2018.
//  Copyright © 2018 MT Creative. All rights reserved.
//

import UIKit

class Team : NSObject{
    var name: String = ""
    var players: [Player] = []
    
    init(name: String){
        super.init()
        self.name = name
    }
    
    func win(){
        
    }
    
}
