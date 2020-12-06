//
//  DataBaseHelper.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import CoreData

class DataBaseHelper {
    
    func saveData(userDataModal : UserDataModal){
        let saveData = UserData(context: PersistanceStore.shareInstance.context)
        saveData.id = userDataModal.id
        saveData.title = userDataModal.title
        saveData.task = userDataModal.task
        PersistanceStore.shareInstance.saveContext()
    }
    
    func fetchFromOject() -> [UserDataModal]
    {
        
        let result = PersistanceStore.shareInstance.fetchingManagedObject(managedOject: UserData.self)
        var userDataArr  = [UserDataModal]()
        
        result?.forEach({
            (userData) in
            userDataArr.append(userData.convertoUserDataModal())
        })
       return userDataArr
    }
    
    func getId(id : UUID) -> UserDataModal? {
        let result = getUserData(byId: id)
        guard result != nil else{return nil}
        return result?.convertoUserDataModal()
    }
    func updatedUserData(updateUserData : UserDataModal) -> Bool{
        
        let updateData = getUserData(byId: updateUserData.id!)
        guard updateData != nil else {return false}
        updateData?.id = updateUserData.id
        updateData?.title = updateUserData.title
        updateData?.task = updateUserData.task
        PersistanceStore.shareInstance.saveContext()
        return true
        
    }
    
    func delete(id : UUID) -> Bool {
        
        let deleteData = getUserData(byId: id)
        
        guard deleteData != nil else {
            return false
        }
        
        PersistanceStore.shareInstance.context.delete(deleteData!)
         PersistanceStore.shareInstance.saveContext()
        return true
    }
    
    
    
    private func getUserData(byId id : UUID) -> UserData? {
        
        let fetchidRequest =  NSFetchRequest<UserData>(entityName: "UserData")
         let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchidRequest.predicate = predicate
        do{
            let  result = try PersistanceStore.shareInstance.context.fetch(fetchidRequest).first
            guard result != nil else{return nil}
            
            return result
        }catch{
            print("fetching faild")
        }
       return nil
    }
}
