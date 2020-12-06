//
//  UserDataModal.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation


class UserDataModal {
    
    var id : UUID?
    let title : String?
    let task : String?
    init(id : UUID? , title : String? , task : String?) {
        self.id = id
        self.title = title
        self.task = task
    }
}
