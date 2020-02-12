//
//  PhonesTableViewCell.swift
//  PhoneBookWithCoreData
//
//  Created by MacOS on 11.02.2020.
//  Copyright © 2020 MacOS. All rights reserved.
//

import UIKit

class PhonesTableViewCell: UITableViewCell {

    @IBOutlet weak var firstAndLastName: UIView!
    
    @IBOutlet weak var firstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
