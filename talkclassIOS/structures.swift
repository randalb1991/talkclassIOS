//
//  structures.swift
//  testtalkclass
//
//  Created by Randall Dani Barrientos Alva on 12/10/17.
//  Copyright © 2017 Randall Dani Barrientos Alva. All rights reserved.
//

import Foundation

struct Credential:Codable{
    var username : String
    var access_key : String
    var secret_key : String
    var session_token: String
}
