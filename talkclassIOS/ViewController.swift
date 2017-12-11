//
//  ViewController.swift
//  talkclassIOS
//
//  Created by Randall Dani Barrientos Alva on 30/9/17.
//  Copyright © 2017 Randall Dani Barrientos Alva. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var roleSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(_ sender: UIButton) {
        let role = self.roleSegment.titleForSegment(at: self.roleSegment.selectedSegmentIndex)!
        loginRequest(name: self.usernameTextField.text!, password: self.passwordTextField.text!, role: role)
    }
    
}

