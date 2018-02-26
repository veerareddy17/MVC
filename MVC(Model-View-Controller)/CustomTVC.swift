//
//  CustomTVC.swift
//  MVC(Model-View-Controller)
//
//  Created by Vera on 07/12/1939 Saka.
//  Copyright © 1939 XeperTechnologies. All rights reserved.
//

import UIKit

class CustomTVC: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
