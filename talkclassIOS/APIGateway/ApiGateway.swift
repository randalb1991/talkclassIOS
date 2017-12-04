//
//  ApiGateway.swift
//  talkclassIOS
//
//  Created by Randall Dani Barrientos Alva on 15/10/17.
//  Copyright © 2017 Randall Dani Barrientos Alva. All rights reserved.
//

import Foundation

func loginRequest(name username:String, password pw:String, role r: String){
    let str = "{\"username\": \"\(username)\", \"password\": \"\(pw)\", \"role\": \"\(r.lowercased())\"}"
    var urlRequest = URLRequest(url: URL(string: "https://utakevspc6.execute-api.eu-west-1.amazonaws.com/production/login")!)
    
    let postData = str.data(using: .utf8)
    
    urlRequest.httpBody = postData
    urlRequest.httpMethod = "POST"
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: urlRequest) { (data, response, error) in
        guard let data = data else{return }
        DispatchQueue.main.async {
            do{
                let decoder = JSONDecoder()
                let credentials = try decoder.decode(Credential.self, from: data)
                print("access key: \(credentials.access_key)")
                print("secret key: \(credentials.secret_key)")
                print("session token: \(credentials.session_token)")
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
    task.resume()
}
