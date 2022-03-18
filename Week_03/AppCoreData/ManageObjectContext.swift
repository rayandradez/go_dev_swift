//
//  ManageObjectContext.swift
//  AppCoreData
//
//  Created by Idwall Go Dev 006 on 17/03/22.
//

import Foundation
import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol managedProtocol {
    func getPerson() -> [Person]
}

protocol managedSaveProtocol {
    func save(person: Person, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(uuid: String, onCompletionHandler: onCompletionHandler)
}


class ManageObjectContext: managedProtocol, managedSaveProtocol, managedDeleteProtocol {
    
    private let entity = "Users"
    
    //get complete context
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getPerson() -> [Person] {
        var listPerson: [Person] = []
        
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        do {
            
            guard let person = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return listPerson }
            
            for item in person {
                if let id = item.value(forKey: "id") as? UUID,
                let name = item.value(forKey: "name") as? String,
                let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    listPerson.append(person)
                }
            }
            
        } catch let error as NSError {
            print("Request Error \(error.localizedDescription)")
            
        }
        
        return listPerson
    }
    
    func save(person: Person, onCompletionHandler: (String) -> Void) {
        <#code#>
    }
    
    func delete(uuid: String, onCompletionHandler: (String) -> Void) {
        <#code#>
    }
    
  
    
    
    

    
}
