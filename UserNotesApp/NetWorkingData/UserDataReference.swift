//
//  UserDataReference.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import CoreData


class UserDataRefernce {
    
     let dataBaseHelper = DataBaseHelper()
    func  createData(userModal : UserDataModal) {
        dataBaseHelper.saveData(userDataModal: userModal)
    }
    
    func fetchuserData() -> [UserDataModal] {
        return dataBaseHelper.fetchFromOject()
    }
    
    func fetchuserData(byId id:UUID) -> UserDataModal? {
        return dataBaseHelper.getId(id: id)
    }
    func updateData(userData : UserDataModal) -> Bool{
       return dataBaseHelper.updatedUserData(updateUserData: userData)
    }
    
    func deleteOject(id : UUID) -> Bool{
        return dataBaseHelper.delete(id: id)
    }
}
