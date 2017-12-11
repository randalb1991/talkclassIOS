//
//  ApiGateway.swift
//  talkclassIOS
//
//  Created by Randall Dani Barrientos Alva on 15/10/17.
//  Copyright © 2017 Randall Dani Barrientos Alva. All rights reserved.
//

import Foundation
import AWSCore
func loginRequest(name username:String, password pw:String, role r: String){
    let str = "{\"username\": \"\(username)\", \"password\": \"\(pw)\", \"role\": \"\(r.lowercased())\"}"
    var urlRequest = URLRequest(url: URL(string: "https://4ybwsxnunf.execute-api.us-east-1.amazonaws.com/dev/talkclass/loginwu")!)
    
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
                saveCredentials(username: credentials.username, access_key: credentials.access_key, secret_key: credentials.secret_key, session_token: credentials.session_token)
                print("access key: \(credentials.access_key)")
                print("secret key: \(credentials.secret_key)")
                print("session token: \(credentials.session_token)")
                print("username: \(credentials.username)")
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
    task.resume()
}
