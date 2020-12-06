//
//  AddDataViewController.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import UIKit


class AddDataViewController: UIViewController {
    
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var userTextView: UITextView!
    @IBOutlet weak var userTitleTF: UITextField!
    
    let userDataRefernce = UserDataRefernce()
    var selectedIndex : UserDataModal? = nil
    var isSelected = false
    var hidedeleteBtn  = false
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        self.view.backgroundColor = UIColor.blue
        //        userTitleTF.backgroundColor = UIColor.blue
        // userTextView.backgroundColor = UIColor.gray
        //        navigationBar.backgroundColor = UIColor.blue
        userTitleTF.textColor = UIColor.black
        userTextView.textColor = UIColor.black
        viewWiillsetup()
        
        
        if hidedeleteBtn == true {
            deleteBtn.isHidden = true
        }
        
    }
    
    
    func viewWiillsetup(){
        self.userTitleTF.text = selectedIndex?.title
        self.userTextView.text = selectedIndex?.task
    }
    
    
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        
        if (userTitleTF.text?.isEmpty)!  && (userTitleTF.text == ""){
            showAlert(str: "Enter Title?", title: "ok")
        } else{
            
            let userDatamodal = UserDataModal(id: UUID(), title: userTitleTF.text!, task: userTextView.text)
            
            
            
            if isSelected  == true{
                let userData = UserDataModal(id: selectedIndex?.id, title: userTitleTF.text!, task: userTextView.text)
                if userDataRefernce.updateData(userData: userData) {
                    self.view.makeToast(message: "Update Data")
                    // print("Updated record")
                }else{
                    print("")
                    self.view.makeToast(message: "This data not updated")
                }
                
            }else{
                self.userDataRefernce.createData(userModal: userDatamodal)
                self.view.makeToast(message: "Data created")
            }
            
            let  navigationvc = (storyboard?.instantiateViewController(identifier: "NotesView"))! as NotesViewController
            navigationController?.pushViewController(navigationvc, animated: true)
            
        }
        
        
        
    }
    @IBAction func deleteData(_ sender: UIButton) {
        
        if ( userDataRefernce.deleteOject(id: (selectedIndex?.id)!)) {
            self.view.makeToast(message: "Delete data")
            let  navigationvc = (storyboard?.instantiateViewController(identifier: "NotesView"))! as NotesViewController
            navigationController?.pushViewController(navigationvc, animated: true)
            
        }
        else{
            print("Data cann't deleted")
        }
        
    }
}

