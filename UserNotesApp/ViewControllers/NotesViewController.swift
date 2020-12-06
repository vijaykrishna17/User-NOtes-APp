//
//  NotesViewController.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import UIKit




class NotesViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var userDtataTableView: UITableView!
    @IBOutlet weak var userSearchBar: UISearchBar!
    
   let userDataRefernce = UserDataRefernce()
   var userDataArray : [UserDataModal]? = nil
 
     
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
        // Register Tableview Cell
       userDtataTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         userDataArray = userDataRefernce.fetchuserData()
        
        if (userDataArray != nil &&  userDataArray?.count != 0) {
             DispatchQueue.main.async {
            self.userDtataTableView.reloadData()
           }
        }
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        let navigationVc = (self.storyboard?.instantiateViewController(identifier: "AddDataView"))! as AddDataViewController
       navigationVc.hidedeleteBtn = true
        
        self.navigationController?.pushViewController(navigationVc, animated: true)
    }
    
}



extension NotesViewController : UITableViewDelegate ,UITableViewDataSource {
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  userDataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        cell.titleLbl.text = userDataArray?[indexPath.row].title
        cell.taskLbl.text = userDataArray?[indexPath.row].task
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 80

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let navigationVc = (self.storyboard?.instantiateViewController(identifier: "AddDataView"))! as AddDataViewController
        navigationVc.selectedIndex = self.userDataArray![self.userDtataTableView.indexPathForSelectedRow!.row]
             navigationVc.isSelected = true
        
        self.navigationController?.pushViewController(navigationVc, animated: true)
    }

    
}
