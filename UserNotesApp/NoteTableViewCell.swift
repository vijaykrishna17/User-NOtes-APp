//
//  NoteTableViewCell.swift
//  UserNotesApp
//
//  Created by vijay g on 03/10/20.
//  Copyright © 2020 developer. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var taskLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
