//
//  PersistanceStore.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import CoreData

class PersistanceStore {
    // MARK: - Core Data stack
    private init(){}
   static let shareInstance = PersistanceStore()

       lazy var persistentContainer: NSPersistentContainer = {
          
           let container = NSPersistentContainer(name: "UserNotesApp")
           container.loadPersistentStores(completionHandler: { (storeDescription, error) in
               if let error = error as NSError? {
                  
                   fatalError("Unresolved error \(error), \(error.userInfo)")
               }
           })
           return container
       }()

       // MARK: - Core Data Saving support
   lazy var context = persistentContainer.viewContext

       func saveContext () {
          
           if context.hasChanges {
               do {
                   try context.save()
               } catch {
                   
                   let nserror = error as NSError
                   fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
               }
           }
       }
    
    func fetchingManagedObject<T:NSManagedObject>(managedOject : T.Type) -> [T]?
    {
        do{
            guard let result = try
                PersistanceStore.shareInstance.context.fetch(managedOject.fetchRequest()) as? [T] else {return nil}
            return result
        }catch {
            print("reult error")
        }
         return nil
    }
   
}
