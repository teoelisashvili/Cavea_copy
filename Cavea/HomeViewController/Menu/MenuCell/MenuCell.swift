//
//  MenuCell.swift
//  Cavea
//
//  Created by Teo Elisashvili on 14.06.21.
//

import UIKit

class MenuCell: UITableViewCell {
    
    static let identifier = "MenuCell"

    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var menuLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
