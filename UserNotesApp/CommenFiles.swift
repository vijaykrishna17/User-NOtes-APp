//
//  CommenFiles.swift
//  UserNotesApp
//
//  Created by vijay g on 07/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import ARKit

extension UIViewController{
    
    func showAlert(str:String,title:String=""){
        let alert = UIAlertController(title: title, message: str, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}

