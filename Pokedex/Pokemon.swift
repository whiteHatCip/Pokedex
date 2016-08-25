//
//  Pokemon.swift
//  Pokedex
//
//  Created by Fabio Cipriani on 25/08/16.
//  Copyright © 2016 Fabio Cipriani. All rights reserved.
//

import Foundation

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _pokedexID: Int!
    
    var name: String {
        get {
            return _name
        } set {
            _name = newValue
        }
    }
    
    var pokedexID: Int {
        get {
            return _pokedexID
        } set {
            _pokedexID = newValue
        }
    }
    
    init(nome: String, ID: Int) {
        self.name = nome
        self.pokedexID = ID
    }
}
