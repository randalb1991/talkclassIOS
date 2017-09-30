//
//  ViewController.swift
//  talkclassIOS
//
//  Created by Randall Dani Barrientos Alva on 30/9/17.
//  Copyright © 2017 Randall Dani Barrientos Alva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.testAWS()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testAWS(){
        let client = RDTalkClassClient.default()
        
        
        client.petstorewalkthroughFlattenallGet().continueWith{ (task: AWSTask?) -> AnyObject? in
            if let error = task?.error {
                print("Error occurred: \(error)")
                return nil
            }
            task?.waitUntilFinished()
            if let completed = task?.isCompleted{
                print("i have the result")
                print(task)
                print(task?.result)
                // Do something with result
            }
            print("nil")
            return nil
        }
        
        
        
        
/*        client.classroomLevelGet(level: "3A Primaria").continueWith{ (task: AWSTask?) -> AnyObject? in
            if let error = task?.error {
                print("Error occurred: \(error)")
                return nil
            }
            
            if let result = task?.result {
                print(result)
                // Do something with result
            }
            
            return nil
        }*/
    }


}

