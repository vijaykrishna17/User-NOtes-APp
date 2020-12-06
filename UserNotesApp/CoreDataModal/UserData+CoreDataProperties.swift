//
//  UserData+CoreDataProperties.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var task: String?
    
    
    
    
    
    
    func convertoUserDataModal() -> UserDataModal {
        return UserDataModal(id: self.id, title: self.title , task: self.task )
    }

}
