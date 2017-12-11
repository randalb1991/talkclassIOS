//
//  Auxiliar.swift
//  talkclassIOS
//
//  Created by Randall Dani Barrientos Alva on 11/12/17.
//  Copyright © 2017 Randall Dani Barrientos Alva. All rights reserved.
//

import Foundation
import CoreData
import UIKit
func exists_credentials_for_user(username: String)->Bool{
    var exists = false
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Credentials")
    //request.predicate = NSPredicate(format: "age = %@", "12")
    request.returnsObjectsAsFaults = false
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            if (data.value(forKey: "username") as! String) == username {
                exists =  true
                return exists
            }
        }
    } catch{
        print("Fallo")
    }
    return exists
}
func saveCredentials(username: String, access_key: String, secret_key: String, session_token: String){
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity =  NSEntityDescription.entity(forEntityName: "Credentials", in: context)
    
    if exists_credentials_for_user(username: username){
        // Si existe en la base de datos, modificaremos la informacion
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Credentials")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if (data.value(forKey: "username") as! String) == username{
                    data.setValue(username, forKey: "username")
                    data.setValue(secret_key, forKey: "secret_key")
                    data.setValue(access_key, forKey: "access_key")
                    data.setValue(session_token, forKey: "session_token")
                }
            }
            
        } catch {
            
            print("Failed")
        }
    }else{
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(username, forKey: "username")
        newUser.setValue(secret_key, forKey: "secret_key")
        newUser.setValue(access_key, forKey: "access_key")
        newUser.setValue(session_token, forKey: "session_token")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Credentials")
    //request.predicate = NSPredicate(format: "age = %@", "12")
    request.returnsObjectsAsFaults = false
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            print(data.value(forKey: "username") as! String)
            print(data.value(forKey: "secret_key") as! String)
        }
        
    } catch {
        
        print("Failed")
    }
    
}
